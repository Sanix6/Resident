from django.db import models
from django.utils.translation import gettext_lazy as _
from django.utils.text import slugify
from transliterate import translit


class Slider(models.Model):
    image = models.ImageField(_('Изображение', ))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    description = models.CharField(_("Текст"), max_length=255, null=True, blank=True)

    class Meta:
        verbose_name = 'Слайдер'
        verbose_name_plural = 'Слайдеры'


class Estate(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(Estate, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Недвижимость'
        verbose_name_plural = 'Недвижимости'


class Holiday(models.Model):
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True)
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(Holiday, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Раскошный отдых'
        verbose_name_plural = 'Раскошный отдых'


class Product(models.Model):
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True)
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(Product, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Продукты'
        verbose_name_plural = 'Продукты'


class Design(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(Design, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Дизайн'
        verbose_name_plural = 'Дизайны'


class Interview(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(Interview, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Интервью'
        verbose_name_plural = 'Интервью'


class Popular(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    CATEGORY_CHOICES = (
        ('Недвижимость', 'Недвижимость'),
        ('Раскошный отдых', 'Раскошный отдых'),
        ('Продукты', 'Продукты'),
        ('Интервью', 'Интервью')
    )
    category = models.CharField(_('Категория'), max_length=255, choices=CATEGORY_CHOICES)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(Popular, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Популярные',
        verbose_name_plural = 'Популярные'
