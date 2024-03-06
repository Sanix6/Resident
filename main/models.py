from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from smart_selects.db_fields import ChainedForeignKey
from transliterate import translit
from django.urls import reverse
from ckeditor.fields import RichTextField
from django.template.defaultfilters import slugify as default_slugify
import uuid

LANG_CHOICES = (
        ("kg","Кыргыз тили"),
        ("ru","Русский язык")
    )


class Slider(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    image = models.ImageField('Изображение')
    title = models.CharField('Название', max_length=255, null=True, blank=True)
    description = models.CharField("Текст", max_length=255, null=True, blank=True)
    

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Слайдеры'


class Category(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    slug = models.SlugField('Слаг', blank=True, null=True)
    name = models.CharField("Название", max_length=255, null=True, blank=True)
    is_active = models.BooleanField('Активно')
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        english_title = translit(self.name, 'ru', reversed=True)
        if english_title is not None:
            self.slug = slugify(english_title)
        super(Category, self).save(*args, **kwargs)

    def __str__(self):
            return f'{self.name}'

    class Meta:
            verbose_name = ''
            verbose_name_plural = 'Категория'


class SubHeader(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    header = models.ForeignKey(Category, on_delete=models.CASCADE, verbose_name='Шапка', related_name='header')
    slug = models.SlugField('Слаг', blank=True, null=True)
    title = models.CharField("Название", max_length=255, null=True, blank=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        english_title = translit(self.title, 'ru', reversed=True)
        if english_title is not None:
            self.slug = slugify(english_title)
        super(SubHeader, self).save(*args, **kwargs)

    def __str__(self):
        return  f'{self.title}'


    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Подкатегория'


class Resident(models.Model):
    language = models.CharField('Язык', choices=LANG_CHOICES, default=('ru'), max_length=255, null=True, blank=True)
    header = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='state', verbose_name='категория')
    name = ChainedForeignKey(
        SubHeader,
        chained_field='header',
        chained_model_field='header',
        show_all=False,
        auto_choose=True,
        sort=True,
        related_name='resident',
        on_delete=models.CASCADE,
        verbose_name='Подкатегория', 
        null=True, blank=True
    )
    slug = models.SlugField('Слаг', max_length=1000,unique=True, null=True, blank=True)
    image = models.ImageField('Изображение')
    title = models.CharField('Название', max_length=255, null=True, blank=True)
    views = models.PositiveIntegerField('Просмотры', default=0)
    data = models.DateField('Дата добавление', null=True, blank=True)
    updated_at = models.DateTimeField('Дата обновление', auto_now=True)
    last_mod = models.DateTimeField('Последняя модификация', auto_now=True)
    save_state = models.BooleanField('Опубликовано', default=False)


    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        english_title = translit(self.title, 'ru', reversed=True)
        if english_title is not None:
            self.slug = slugify(english_title)
        super(Resident, self).save(*args, **kwargs)
    
    def __str__(self):
        return  f'{self.title}'

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Журнал'



class ResidentDetail(models.Model):
    key = models.ForeignKey(Resident, on_delete=models.CASCADE, related_name='resident')
    description = RichTextField('Text', config_name='default',  null=True, blank=True)

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'

