from django.db import models
from django.utils.text import slugify
from smart_selects.db_fields import ChainedForeignKey
from transliterate import translit
from django.urls import reverse
from ckeditor_uploader.fields import RichTextUploadingField
from ckeditor.fields import RichTextField
from django.template.defaultfilters import slugify as default_slugify
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User
import threading
from django.db.models.signals import post_save
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.core.exceptions import MultipleObjectsReturned



current_user = threading.local()



LANG_CHOICES = (
        ("kg","Кыргыз тили"),
        ("ru","Русский язык")
    )


class Slider(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    title = models.CharField('Название', max_length=255)
    description = models.CharField("Текст", max_length=255, null=True, blank=True)
    url = models.URLField('Укажите ссылку', null=True, blank=True)
    img = models.ImageField('Изображение', upload_to='slider/',  blank=True, null=True)
    
    
    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Слайдеры'


    def __str__(self):
        return self.title



class Category(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    title = models.CharField("Название", unique=True, max_length=255, null=True, blank=True)
    is_active = models.BooleanField('Статус')
    slug = models.SlugField('Слаг', blank=True, null=True, editable=False)
    

    class Meta:
            verbose_name = ''
            verbose_name_plural = 'Категории'

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


class Post(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='Пользователь', editable=False)
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    cat = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name='категория')
    sub_cat = ChainedForeignKey(
        SubCategory, 
        chained_field='cat',
        chained_model_field='cat',
        show_all=False, auto_choose=True,
        sort=True, related_name='resident',
        on_delete=models.CASCADE,
        verbose_name='Подкатегория',
        null=True,
        blank=True
        )
    title = models.CharField('Название', max_length=255, null=True, blank=True)
    img = models.ImageField('Изображение', upload_to='post/%Y_%m/', blank=True, null=True)
    is_active = models.BooleanField('Опубликовать', default=False)
    tags = models.CharField(verbose_name='Теги', null=True, blank=True)
    slug = models.SlugField('Слаг', max_length=1000, unique=True, null=True, blank=True, editable=False)
    created_at = models.DateTimeField('Дата добавление', null=True, blank=True, auto_now_add=True, editable=False)
    updated_at = models.DateTimeField('Дата обновление', auto_now=True)
    views = models.PositiveIntegerField('Просмотры', default=0, editable=False)
    is_save = models.BooleanField('Показать на главной страинце', default=True)
    is_main = models.BooleanField('На главную ячейку', default=False)

    def __str__(self):
        return  f'{self.title}'
    
    def save(self, *args, **kwargs):
        if not self.user_id:
            request = kwargs.pop('request', None)
            if request and hasattr(request, 'user'):
                self.user = request.user
        self.slug = slugify(self.title)
        english_title = translit(self.title, 'ru', reversed=True)
        if english_title is not None:
            self.slug = slugify(english_title)



        super(Post, self).save(*args, **kwargs)
    

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Статьи'
        ordering = ['-updated_at']

@receiver(pre_save, sender=Post)
def update_is_save_main(sender, instance, **kwargs):
    if instance.is_save and instance.is_main:
        instance.is_main = False
    elif not instance.is_save and not instance.is_main:
        instance.is_save = True
    
    if instance.is_main:
        try:
            current_main = sender.objects.get(is_main=True)
            if current_main != instance:
                current_main.is_main = False
                current_main.save(update_fields=['is_main'])
        except sender.DoesNotExist:
            pass
        except sender.MultipleObjectsReturned:
            sender.objects.filter(is_main=True).update(is_main=False)



class PostDetail(models.Model):
    main = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='detail')
    description = RichTextUploadingField('Подробнее', config_name='default', null=True, blank=True)

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'


class PostSlider(models.Model):
    slider = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='slider')
    image = models.ImageField('Изображение', null=True, blank=True)

    class Meta:
        verbose_name = 'Слайдер'
        verbose_name_plural = 'Слайдер'

    
class PostFile(models.Model):
    exception = models.ForeignKey(Post, on_delete=models.SET_NULL, null=True, related_name ='exception')
    title = models.CharField('Заголовок', max_length=255, null=True, blank=True)
    file = models.FileField('Прикрепить файл', upload_to='uploads/', null=True, blank=True)

    class Meta:
        verbose_name = 'Файл'
        verbose_name_plural = 'Файл'


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
    