from django.db import models
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from smart_selects.db_fields import ChainedForeignKey
from transliterate import translit
from django.urls import reverse
from ckeditor.fields import RichTextField



class Slider(models.Model):
    image = models.ImageField(_('Изображение'))
    title = models.CharField(_('Название'), max_length=255, null=True, blank=True)
    description = models.CharField(_("Текст"), max_length=255, null=True, blank=True)

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Слайдеры'



class Header(models.Model):
    title = models.CharField('Категория', max_length=255)

    def __str__(self):
        return f'{self.title}'

    class Meta:
        verbose_name_plural = 'Заголовка'


class SubHeader(models.Model):
    slug = models.SlugField(_('Слаг'),null=True, blank=True)
    key = models.ForeignKey(Header, on_delete=models.CASCADE, related_name='key')
    title = models.CharField('Подкатегория', max_length=255, null=True, blank=True)
    

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        if self.title:
            english_title = translit(self.title, 'ru', reversed=True)
            self.slug = slugify(english_title)
        super(SubHeader, self).save(*args, **kwargs)

    def __str__(self):
        return f'{self.title}'

    class Meta:
        verbose_name_plural='Подкатегория'


class Category(models.Model):
    name = models.CharField("Название", max_length=255, null=True, blank=True)

    def __str__(self):
        return f'{self.name}'

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Категория'


class SubCategory(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name="key", verbose_name="Категория")
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    title = models.CharField('Подкатегории', max_length=100)
    
    def __str__(self):
        return  f'{self.title}'
    


    class Meta:
        verbose_name_plural = 'Подкатегория'


class Resident(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='state', verbose_name='категория')
    name = ChainedForeignKey(
        SubCategory,
        chained_field='category',
        chained_model_field='category',
        show_all=False,
        auto_choose=True,
        sort=True,
        on_delete=models.CASCADE,
        null=True,
        blank=True
    )
    slug = models.SlugField(_('Слаг'), unique=True, null=True, blank=True)
    image = models.ImageField(_('Изображение'))
    title = models.CharField('Название', max_length=255, null=True, blank=True)
    LANG_CHOICES = (
        ("Кыргыз тили","Кыргыз тили"),
        ("Русский язык","Русский язык")
    )
    lang = models.CharField('Язык', choices=LANG_CHOICES, max_length=2555, null=True, blank=True)
    data = models.DateField(_('Дата добавление'), null=True, blank=True)
    updated_at = models.DateTimeField('Дата обновление', auto_now=True)
    last_mod = models.DateTimeField(_('Последняя модификация'), auto_now=True)
    save_state = models.BooleanField(_('Сохранить'), default=False)


    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        english_title = translit(self.title, 'ru', reversed=True)
        if english_title is not None:
            self.slug = slugify(english_title)
        super(Resident, self).save(*args, **kwargs)
    
    def __str__(self):
        return  f'{self.title}'

    def get_absolute_url(self):
        return reverse('resident_detail', kwargs={'slug': self.slug})

    class Meta:
        verbose_name = ''
        verbose_name_plural = 'Статья'

    # def save(self, *args, **kwargs):
    #     if self.save_state:
    #         self.publication_status.is_active = True
    #         self.publication_status.is_draft = False
    #     else:
    #         self.publication_status.is_active = False
    #         self.publication_status.is_draft = True
    #     super().save(*args, **kwargs)


    # @property
    # def publication_status(self):
    #     return self.publication_status



class ResidentDetail(models.Model):
    key = models.ForeignKey(Resident, on_delete=models.CASCADE, related_name='resident')
    description = RichTextField(_('Text'), config_name='default',  null=True, blank=True)

    class Meta:
        verbose_name = 'Дополнительно'
        verbose_name_plural = 'Дополнительно'



# class PublicationStatus(models.Model):
#     resident = models.OneToOneField(Resident, on_delete=models.CASCADE, related_name='publication_status', verbose_name='Cтатус статьи')
#     is_active = models.BooleanField(_('Опубликовано'), default=False)
#     is_draft = models.BooleanField(_('Черновик'), default=True)

#     class Meta:
#         verbose_name_plural = 'Статус статьи'





    
class Test(models.Model):
    title = models.CharField(max_length=255)
    