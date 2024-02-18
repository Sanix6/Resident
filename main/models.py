from django.db import models
from django.utils.translation import gettext_lazy as _
from django.utils.text import slugify
from transliterate import translit
from django_ckeditor_5.fields import CKEditor5Field

class Slider(models.Model):
    image = models.ImageField(_('Изображение', ))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    description = models.CharField(_("Текст"), max_length=255, null=True, blank=True)

    class Meta:
        verbose_name = 'Слайдер'
        verbose_name_plural = 'Слайдеры'


class Estate(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    CATEGORY_CHOICES = (
        ('Отели','Отели'),
        ('Рестораны','Рестораны'),
        ('Спа-салоны','Спа-салоны')
    ) 
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True, choices=CATEGORY_CHOICES, default=None)
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




class EstateDetail(models.Model):
    key = models.ForeignKey(Estate, on_delete=models.CASCADE, null=True, blank=True, related_name='estate')
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    CATEGORY_CHOICES = (
        ('Отели','Отели'),
        ('Рестораны','Рестораны'),
        ('Спа-салоны','Спа-салоны')
    ) 
    category = models.CharField(_('Категория статьи'), max_length=255, choices=CATEGORY_CHOICES, default=None)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    name = models.CharField(_('Имя'),max_length=255, null=True, blank=True)
    description =CKEditor5Field(_('Text'), config_name='extends')
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(EstateDetail, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'


class Holiday(models.Model):
    CATEGORY_CHOICES = (
        ('Отели','Отели'),
        ('Рестораны','Рестораны'),
        ('Спа-салоны','Спа-салоны')
    ) 
    category = models.CharField(_('Категория статьи'), max_length=255,choices=CATEGORY_CHOICES, default=None)
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



class HolidayDetail(models.Model):
    key = models.ForeignKey(Holiday, on_delete=models.CASCADE, null=True, blank=True, related_name='holiday')
    CATEGORY_CHOICES = (
        ('Отели','Отели'),
        ('Рестораны','Рестораны'),
        ('Спа-салоны','Спа-салоны')
    ) 
    category = models.CharField(_('Категория статьи'), max_length=255, choices=CATEGORY_CHOICES, default=None)
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    name = models.CharField(_('Имя'),max_length=255, null=True, blank=True)
    description = CKEditor5Field(_('Текст'), config_name='extends', null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(HolidayDetail, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'


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



class ProductDetail(models.Model):
    key = models.ForeignKey(Product, on_delete=models.CASCADE, null=True, blank=True, related_name='product')
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True)
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    name = models.CharField(_('Имя'),max_length=255, null=True, blank=True)
    description = CKEditor5Field(_('Текст'),  config_name='extends',null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(ProductDetail, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'


class Design(models.Model):
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    CATEGORY_CHOICES = (
        ('Отели','Отели'),
        ('Рестораны','Рестораны'),
        ('Спа-салоны','Спа-салоны')
    ) 
    category = models.CharField(_('Категория статьи'), max_length=255, choices=CATEGORY_CHOICES, default=None)
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



class DesignDetail(models.Model):
    key = models.ForeignKey(Design, on_delete=models.CASCADE, null=True, blank=True, related_name='design')
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    CATEGORY_CHOICES = (
        ('Отели','Отели'),
        ('Рестораны','Рестораны'),
        ('Спа-салоны','Спа-салоны')
    ) 
    category = models.CharField(_('Категория статьи'), max_length=255, choices=CATEGORY_CHOICES, default=None)   
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    name = models.CharField(_('Имя'),max_length=255, null=True, blank=True)
    description = CKEditor5Field(_('Текст'), config_name='extends', null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(DesignDetail, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'


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



class InterviewDetail(models.Model):
    key = models.ForeignKey(Interview, on_delete=models.CASCADE, null=True, blank=True, related_name='interview')
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    category = models.CharField(_('Категория статьи'), max_length=255, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    name = models.CharField(_('Имя'),max_length=255, null=True, blank=True)
    description = CKEditor5Field(_('Текст'),  config_name='extends',null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(InterviewDetail, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'


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



class PopularDetail(models.Model):
    key = models.ForeignKey(Popular, on_delete=models.CASCADE, null=True, blank=True, related_name='popular')
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
    name = models.CharField(_('Имя'),max_length=255, null=True, blank=True)
    description = CKEditor5Field(_('Текст'), config_name='extends', null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    last_mod = models.DateTimeField(_('Последняя мадификация'), auto_now=True)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        self.date = self.data.strftime("%d%m%Y")
        english_title = translit(self.title, 'ru', reversed=True)
        self.slug = slugify(english_title)
        super(PopularDetail, self).save(*args, **kwargs)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = 'Дополнительно',
        verbose_name_plural = 'Дополнительно'


from django.contrib.auth.models import User


