from django.contrib import admin
from .models import *


@admin.register(Slider)
class SliderAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(Estate)
class EstateAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(Holiday)
class HolidayAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(Design)
class DesignAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(Interview)
class InterviewAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(Popular)
class PopularAdmin(admin.ModelAdmin):
    list_display = ['title', 'category']
