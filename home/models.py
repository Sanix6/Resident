from django.db import models
from django.utils.translation import gettext_lazy as _
from django.utils.text import slugify
from transliterate import translit
from ckeditor.fields import RichTextField


class About(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    category = models.CharField(_('Категория'), max_length=50, null=True, blank=True)
    title = models.CharField(_('Название'), max_length=100, null=True, blank=True)
    img = models.ImageField(_('Изоброжение'), null=True, blank=True)
    last_mood = models.DateField(_('Последняя модификация'), null=True, blank=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        if self.title:
            english_title = translit(self.title, 'ru', reversed=True)
            self.slug = slugify(english_title)
        super(About, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'О нас'
        verbose_name_plural = 'О нас'


class AboutDetail(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    category = models.ForeignKey(About, null=True, blank=True, on_delete=models.CASCADE, related_name='key')
    title = models.CharField(_('Название'), max_length=100, null=True, blank=True)
    description = RichTextField(_('Text'))
    img = models.ImageField(_('Изоброжение'), null=True, blank=True)
    last_mood = models.DateField(_('Последняя модификация'), null=True, blank=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        if self.title:
            english_title = translit(self.title, 'ru', reversed=True)
            self.slug = slugify(english_title)
        super(About, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'О нас'
        verbose_name_plural = 'О нас'
