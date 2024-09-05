from django.db import models
from django.utils.text import slugify
from smart_selects.db_fields import ChainedForeignKey
from django.core.exceptions import ValidationError
import os
from transliterate import translit
from django.urls import reverse
from ckeditor_uploader.fields import RichTextUploadingField
from ckeditor.fields import RichTextField
from django.template.defaultfilters import slugify as default_slugify
from django.contrib.auth.models import User
import threading
from django.db.models.signals import pre_save
from django.dispatch import receiver
from .paginations import *
from django.core.exceptions import ObjectDoesNotExist
from django.db.models import UniqueConstraint



current_user = threading.local()



LANG_CHOICES = (
        ("kg","Кыргыз тили"),
        ("ru","Русский язык")
    )


class Category(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    title = models.CharField("Название", unique=True, max_length=255, null=True, blank=True)
    is_active = models.BooleanField('Статус')
    slug = models.SlugField('Слаг', blank=True, null=True, editable=False)
    

    class Meta:
            verbose_name = ''
            verbose_name_plural = 'Каталог'

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        english_title = translit(self.title, 'ru', reversed=True)
        if english_title is not None:
            self.slug = slugify(english_title)
        super(Category, self).save(*args, **kwargs)

    
    def __str__(self):
            return f'{self.title}'    



class SubCategory(models.Model):
    cat = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name='Шапка', related_name='subcategory')
    title = models.CharField("Название", max_length=255, null=True, blank=True)
    slug = models.SlugField('Слаг', blank=True, null=True, editable=False)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        english_title = translit(self.title, 'ru', reversed=True)
        if english_title is not None:
            self.slug = slugify(english_title)
        super(SubCategory, self).save(*args, **kwargs)

    def __str__(self):
        return  f'{self.title}'

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Подкатегории'


class Status(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    blog = models.CharField('Показать в блоке', max_length=255,null=True, blank=True, choices=STATUS_CHOICES)


    def __str__(self):
        return f'{self.blog}'

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Блог'


class Post(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Пользователь', editable=False)
    language = models.CharField('Язык', choices=LANG_CHOICES, default='ru', max_length=255, null=True, blank=True)
    cat = ChainedForeignKey(
        Category,
        chained_field='language',
        chained_model_field='language',
        show_all=False,
        auto_choose=True,
        sort=True,
        related_name='posts',
        on_delete=models.CASCADE,
        verbose_name='категория'
    )
    status = ChainedForeignKey(
        Status,
        chained_field='language',
        chained_model_field='language',
        show_all=False,
        auto_choose=True,
        sort=True,
        related_name='posts',
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        verbose_name='Показывать в блоге'
    )
    sub_cat = ChainedForeignKey(
        SubCategory, 
        chained_field='cat',
        chained_model_field='cat',
        show_all=False,
        auto_choose=True,
        sort=True,
        related_name='resident',
        on_delete=models.CASCADE,
        verbose_name='Подкатегория',
        null=True,
        blank=True
    )
    title = models.CharField('Название', max_length=255)
    is_main = models.CharField('Позиция', null=True, blank=True, choices=POSITION_CHOICES, max_length=255)
    img = models.ImageField('Изображение', upload_to='images', blank=True, null=True)
    is_active = models.BooleanField('Опубликовать', default=False)
    tags = models.CharField(verbose_name='Теги', max_length=255, null=True, blank=True)
    slug = models.SlugField('Слаг', max_length=1000, unique=True, null=True, blank=True, editable=False)
    created_at = models.DateTimeField('Дата добавление', null=True, blank=True, auto_now_add=True, editable=False)
    updated_at = models.DateTimeField('Дата обновление', auto_now=True)
    views = models.PositiveIntegerField('Просмотры', default=0, editable=False)

    def __str__(self):
        return f'{self.title}'
    

    def save(self, *args, **kwargs):
        if not self.user_id:
            request = kwargs.pop('request', None)
            if request and hasattr(request, 'user'):
                self.user = request.user

        self.slug = slugify(self.title)
        english_title = translit(self.title, 'ru', reversed=True)
        if english_title:
            self.slug = slugify(english_title)

        if self.is_main == '1':
            Post.objects.filter(status=self.status, is_main='1').update(is_main=None)

        elif self.is_main in ['2', '3']:
            existing_posts = Post.objects.filter(status=self.status, is_main=self.is_main)
            if existing_posts.count() >= 4:
                post_to_update = existing_posts.earliest('created_at')
                post_to_update.is_main = None
                post_to_update.save()

        super(Post, self).save(*args, **kwargs)
        
    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Статьи'
        ordering = ['-updated_at']




class PostDetail(models.Model):
    main = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='detail')
    description = RichTextUploadingField("Подробнее",config_name='default', null=True, blank=True)

    class Meta:
        verbose_name = 'Контент'
        verbose_name_plural = 'Контент'


class PostSlider(models.Model):
    slider = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='slider')
    image = models.ImageField('Изображение', null=True, blank=True)

    class Meta:
        verbose_name = 'Слайдер'
        verbose_name_plural = 'Слайдер'


    
class PostFile(models.Model):
    exception = models.ForeignKey(Post, on_delete=models.SET_NULL, null=True, related_name ='exception')
    title = models.CharField('Заголовок', max_length=255, null=True, blank=True)
    file = models.FileField('Прикрепить файл', upload_to='uploads/file', null=True, blank=True)

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'


class Comments(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='comment', verbose_name='статья')
    user = models.CharField('Имя', max_length=30)
    comment = RichTextField('Комментарии')
    created_at = models.DateTimeField(auto_now_add=True, blank=True, null=True, verbose_name='создано')
    is_active = models.BooleanField('Опубликовать', default=False)

    class Meta:
        verbose_name = ""
        verbose_name_plural = 'Комментарии'


    def __str__(self):
        return self.comment
    

class Banner(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    blog = models.CharField('Блог', choices=BANNER_CHOICES, max_length=255)
    ratation = models.CharField('Рoтация', choices=RATATION_CHOICES, max_length=255)
    pc_image = models.ImageField('Баннер для ПК Версии', upload_to='slider/',  blank=True, null=True)
    mb_img = models.ImageField('Баннер для Моб Версии', upload_to='slider/', blank=True, null=True)
    url = models.URLField('Укажите ссылку', max_length=200)
    date = models.DateField('Дата истечение')
    
    
    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Баннер'
        constraints = [
            UniqueConstraint(fields=['blog', 'ratation'], name='unique_blog_ratation')
        ]
