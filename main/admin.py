from django.contrib import admin
from .models import *
from django.utils.safestring import mark_safe



@admin.register(Slider)
class SliderAdmin(admin.ModelAdmin):
    list_display = ['title', "get_html_image"]

    def get_html_image(self, object):
        if object.image:
            return mark_safe(f"<image src='{object.image.url}' height='100'>")

    get_html_image.short_description = "Изображение"


class SubCategoryInline(admin.StackedInline):
    model = SubCategory
    extra = 0


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    inlines = [SubCategoryInline]
    list_display = ['name']
    



class ResidentInline(admin.StackedInline):
   model = ResidentDetail
   extra = 1
   

@admin.register(Resident)
class ResidentAdmin(admin.ModelAdmin):
    inlines = [ResidentInline]
    list_display = ['title', "get_html_image", 'category', 'lang']


    def get_html_image(self, object):
        if object.image:
            return mark_safe(f"<image src='{object.image.url}' height='100'>")

    get_html_image.short_description = "Изображение"

