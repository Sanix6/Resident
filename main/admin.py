from django.contrib import admin
from .models import *
from django.utils.safestring import mark_safe
from django.utils.html import format_html
import admin_thumbnails
from django.contrib.auth.models import Group, User
from PIL import Image
from io import BytesIO
import sys
from django.core.files.uploadedfile import InMemoryUploadedFile


admin.site.unregister(Group)
admin.site.unregister(User)



@admin.register(Slider)
# @admin_thumbnails.thumbnail('image')
class SliderAdmin(admin.ModelAdmin):
    list_display = ['title', "get_html_image"]
    actions_on_top = False


    # def save_model(self, request, obj, form, change):
    #     if obj.image:
    #         img = Image.open(obj.image)
    #         max_size = (460, 460)
    #         img.thumbnail(max_size)
    #         thumb_io = BytesIO()
    #         img.save(thumb_io, format='PNG', quality=100)
    #         thumb_file = InMemoryUploadedFile(thumb_io, None, 'thumb.jpg', 'image/jpeg', sys.getsizeof(thumb_io), None)
    #         obj.image = thumb_file
    #     super().save_model(request, obj, form, change)

    def get_html_image(self, object):
        if object.image:
            return mark_safe(f"<image src='{object.image.url}' height='100'>")

    get_html_image.short_description = "Изображение"


class SubHeaderInline(admin.StackedInline):
    model = SubHeader
    extra = 1


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    inlines = [SubHeaderInline]
    list_display = ['name',]

    actions_on_top = False


class ResidentInline(admin.StackedInline):
   model = ResidentDetail
   extra = 1
   


@admin.register(Resident)
@admin_thumbnails.thumbnail('image')
class ResidentAdmin(admin.ModelAdmin):
    inlines = [ResidentInline]
    list_display = ('title', 'get_html_image', 'header', 'data', 'updated_at', 'views',  'save_state')


    def save_model(self, request, obj, form, change):
        if obj.image:
            img = Image.open(obj.image)
            max_size = (460, 460)
            img.thumbnail(max_size)
            thumb_io = BytesIO()
            img.save(thumb_io, format='PNG', quality=100)
            thumb_file = InMemoryUploadedFile(thumb_io, None, 'thumb.jpg', 'image/jpeg', sys.getsizeof(thumb_io), None)
            obj.image = thumb_file
        super().save_model(request, obj, form, change)

    def get_html_image(self, obj):
        if obj.image:
            return mark_safe(f'<img src="{obj.image.url}" style="max-height: 100px; max-width: 100px;" />')
        return None

    
    get_html_image.short_description = 'Изображение'


    
