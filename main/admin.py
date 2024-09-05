from django.contrib import admin
from .models import *
from django.utils.safestring import mark_safe
import admin_thumbnails
from django.core.files.uploadedfile import InMemoryUploadedFile
from io import BytesIO
import sys
from PIL import Image
from django.utils.html import format_html
from django.template.defaultfilters import truncatechars
from datetime import datetime, timedelta, date
from django.utils.timezone import now
from django.utils import timezone

@admin.register(Banner)
@admin_thumbnails.thumbnail('pc_image')
class BannerAdmin(admin.ModelAdmin):
    list_display = ['get_html_pc_image', 'get_html_img', 'blog', 'ratation', 'language', 'colored_date']
    list_display_links = list_display
    list_filter = ['language']

    def save_model_img(self, request, obj, form, change):
        if obj.pc_image:
            pc_image = Image.open(obj.pc_image)
            max_size = (850, 850)
            pc_image.thumbnail(max_size)
            thumb_io = BytesIO()
            pc_image.save(thumb_io, format='JPG', quality=100)
            thumb_file = InMemoryUploadedFile(thumb_io, None, 'thumb.jpg', 'image/jpeg', sys.getsizeof(thumb_io), None)
            obj.pc_image = thumb_file
        super().save_model(request, obj, form, change)

    
    def get_html_pc_image(self, obj):
        if obj.pc_image:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height: 100px; max-width: 100px; border-radius: 10px;" /></a>', obj.pc_image.url, obj.pc_image.url)
        return None

    get_html_pc_image.short_description = 'ПК Версия'

    def get_html_img(self, obj):
        if obj.mb_img:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height: 100px; max-width: 100px; border-radius: 10px;" /></a>', obj.mb_img.url, obj.mb_img.url)
        return None

    get_html_img.short_description = 'Моб Версия'

    def colored_date(self, obj):
        if isinstance(obj.date, date) and not isinstance(obj.date, datetime):
            obj_date = timezone.make_aware(datetime.combine(obj.date, datetime.min.time()), timezone.get_current_timezone())
        else:
            obj_date = obj.date
        now = timezone.now()
        time_diff = now - obj_date
        
        if time_diff > timedelta(hours=24):
            color = 'red'
        else:
            color = 'green'
        
        return format_html('<span style="color: {};">{}</span>', color, obj_date.strftime('%Y-%m-%d'))

    colored_date.short_description = 'Дата истечение'


class SubCategoryInline(admin.StackedInline):
    model = SubCategory
    extra = 1


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    inlines = [SubCategoryInline]
    list_display = ['formatted_title', 'formatted_language', 'is_active']
    list_display_links = ['formatted_title']
    list_per_page = 8
    list_filter = ['language']


    def formatted_language(self, obj):
        if obj.language == 'kg':
            return format_html(
                '<span style="color: #FF0000; font-weight: bold; font-family: Arial, sans-serif; font-size: 14px;">{}</span>',
                obj.language,
            )
        else:
            return format_html(
                '<span style="color: #0000FF; font-weight: bold; font-family: Courier, monospace; font-size: 14px;">{}</span>',
                obj.language,
            )
    formatted_language.short_description = 'Язык'

    def formatted_title(self, obj):
        if obj.language == 'kg':
            return format_html(
                '<span style="color: #FF0000; font-weight: bold; font-family: Arial, sans-serif; font-size: 16px;">{}</span>',
                obj.title,
            )
        else:
            return format_html(
                '<span style="color: #0000FF; font-weight: bold; font-family: Courier, monospace; font-size: 16px;">{}</span>',
                obj.title,
            )
    formatted_title.short_description = 'Название'



class PostSliderInline(admin.StackedInline):
    model = PostSlider
    extra = 1


class PostDetailInline(admin.StackedInline):
   model = PostDetail
   extra = 1

class PostFileInline(admin.StackedInline):
    model = PostFile
    extra = 1

@admin.register(Status)
class StatusInline(admin.ModelAdmin):
    list_display = ['formatted_language', 'formatted_title']
    list_display_links = list_display
    list_filter = ['language']
    list_per_page = 8

    def formatted_language(self, obj):
        if obj.language == 'kg':
            return format_html(
                '<span style="color: #FF0000; font-weight: bold; font-family: Arial, sans-serif; font-size: 14px;">{}</span>',
                obj.language,
            )
        else:
            return format_html(
                '<span style="color: #0000FF; font-weight: bold; font-family: Courier, monospace; font-size: 14px;">{}</span>',
                obj.language,
            )
    formatted_language.short_description = 'Язык'

    def formatted_title(self, obj):
        if obj.language == 'kg':
            return format_html(
                '<span style="color: #FF0000; font-weight: bold; font-family: Arial, sans-serif; font-size: 16px;">{}</span>',
                obj.blog,
            )
        else:
            return format_html(
                '<span style="color: #0000FF; font-weight: bold; font-family: Courier, monospace; font-size: 16px;">{}</span>',
                obj.blog,
            )
    formatted_title.short_description = 'Название'


@admin.register(Post)
@admin_thumbnails.thumbnail('img')
class PostAdmin(admin.ModelAdmin):
    inlines = [PostDetailInline, PostSliderInline, PostFileInline]
    list_display = ('get_html_image', 'title', 'formatted_cat', 'status', 'is_active', 'is_main', 'updated_at',)
    list_display_links = ('title', 'formatted_cat')
    search_fields = ['title', 'cat__title', 'sub_cat__title']
    list_filter = ['cat','language', 'status', 'is_main', 'is_active']
    list_per_page = 8

    def save_model(self, request, obj, form, change):
        if not obj.user_id:  
            obj.user = request.user
        
        if obj.img:
            img = Image.open(obj.img)
            max_size = (850, 850)
            img.thumbnail(max_size)

            if img.mode == 'RGBA':
                img = img.convert('RGB')

            thumb_io = BytesIO()
            quality = 85

            while True:
                thumb_io = BytesIO()
                img.save(thumb_io, format='JPEG', quality=quality)
                size = thumb_io.tell()

                if size <= 200 * 1024:
                    break
                else:
                    quality -= 5

                if quality < 10:
                    break

            thumb_file = InMemoryUploadedFile(thumb_io, None, obj.img.name, 'image/jpeg', sys.getsizeof(thumb_io), None)
            obj.img = thumb_file
        
        obj.save()

    def get_html_image(self, obj):
        if obj.img:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height: 100px; max-width: 100px; border-radius: 10px;" /></a>', obj.img.url, obj.img.url)
        return None
    
    get_html_image.short_description = 'Изображение'
    
    def formatted_cat(self, obj):
        if obj.cat.language == 'ru':
            return f"{obj.cat.title} (ru)"
        elif obj.cat.language == 'kg':
            return f"{obj.cat.title} (kg)"
        else:
            return obj.cat.title

    formatted_cat.short_description = 'Категория'



@admin.register(Comments)
class CommentAdmin(admin.ModelAdmin):
    list_display = ['post', 'formatted_name', 'is_comment', 'is_active', 'created_at']
    readonly_fields = ['user', ]
    list_editable = ['is_active']
    list_display_links = ['post']
    list_filter = ['user', 'is_active']
    list_per_page = 8
    
    def has_add_permission(self, request):
        return False
    
    def is_comment(self, obj):
        return truncatechars(obj.comment, 100)
    is_comment.short_description = 'комментарии'

    def formatted_name(self, obj):
        return format_html('<b>{}</b>', obj.user)
    formatted_name.short_description = 'имя'
    
    def get_readonly_fields(self, request, obj=None):
        if obj:
            return ['post', 'user', 'created_at', 'comment']
        else:
            return []
    def get_image(self, obj):
        if obj.post.img:
            return format_html('<a href="{}" target="_blank"><img src="{}" style="max-height: 100px; max-width: 100px; border-radius: 10px;" /></a>', obj.post.img.url, obj.post.img.url)
        return None
    get_image.short_description = 'изображение'


    