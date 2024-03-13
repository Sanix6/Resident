from django.contrib import admin
from django.http import HttpRequest
from .models import *
from django.utils.safestring import mark_safe
import admin_thumbnails
from django.contrib.auth.models import Group, User
from django.core.files.uploadedfile import InMemoryUploadedFile
from io import BytesIO
import sys
from PIL import Image
from django.utils.html import format_html
from django.contrib.auth.models import User
from django.urls import path
from django.http import HttpResponse
from django.shortcuts import redirect
from admin_extra_buttons.api import button
from admin_extra_buttons.utils import HttpResponseRedirectToReferrer
from django.template.defaultfilters import truncatechars

# admin.site.unregister(Group)
# admin.site.unregister(User)



@admin.register(Slider)
class SliderAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', "language", "get_html_img"]
    list_display_links = list_display

    def get_html_img(self, object):
        if object.img:
            return mark_safe(f"<img src='{object.img.url}' height='60'>")

    get_html_img.short_description = "Изображение"


class SubCategoryInline(admin.StackedInline):
    model = SubCategory
    extra = 1


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    inlines = [SubCategoryInline]
    list_display = ['id', 'title', 'language', 'is_active']
    list_display_links = ['id', 'title']


class PostDetailInline(admin.StackedInline):
   model = PostDetail
   extra = 1
   
@admin.register(Post)
@admin_thumbnails.thumbnail('img')
class PostAdmin(admin.ModelAdmin):
    inlines = [PostDetailInline]
    list_display = ('id', 'title', 'cat', 'is_active', 'get_html_image','created_at', 'updated_at',)
    list_display_links = ('id', 'title', 'cat')
    search_fields = ['title', 'cat__title', 'sub_cat__title']

    def save_model(self, request, obj, form, change):
        if not obj.user_id:  
            obj.user = request.user
        obj.save()

    def save_model_img(self, request, obj, form, change):
        if obj.img:
            img = Image.open(obj.img)
            max_size = (750, 750)
            img.thumbnail(max_size)
            thumb_io = BytesIO()
            img.save(thumb_io, format='PNG', quality=100)
            thumb_file = InMemoryUploadedFile(thumb_io, None, 'thumb.jpg', 'image/jpeg', sys.getsizeof(thumb_io), None)
            obj.img = thumb_file
        super().save_model(request, obj, form, change)

    def get_html_image(self, obj):
        if obj.img:
            return mark_safe(f'<img src="{obj.img.url}" style="max-height: 100px; max-width: 100px;" />')
        return None

    
    get_html_image.short_description = 'Изображение'
    

@admin.register(Comments)
class CommentAdmin(admin.ModelAdmin):
    list_display = ['get_image', 'post', 'formatted_name', 'is_comment', 'is_active', 'created_at']
    readonly_fields = ['user', ]
    list_editable = ['is_active']
    list_display_links = ['post']
    
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


    