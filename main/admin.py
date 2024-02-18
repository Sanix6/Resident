from django.contrib import admin
from .models import *


@admin.register(Slider)
class SliderAdmin(admin.ModelAdmin):
    list_display = ['title']

class EstateInline(admin.StackedInline):
   model = EstateDetail


@admin.register(Estate)
class EstateAdmin(admin.ModelAdmin):
    inlines = [EstateInline]
    list_display = ['title']

class HolidayInline(admin.StackedInline):
    model = HolidayDetail


@admin.register(Holiday)
class HolidayAdmin(admin.ModelAdmin):
    inlines = [HolidayInline]
    list_display = ['title']


class ProductInlilne(admin.StackedInline):
    model = ProductDetail


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    inlines = [ProductInlilne]
    list_display = ['title']


class DesignInline(admin.StackedInline):
    model = DesignDetail


@admin.register(Design)
class DesignAdmin(admin.ModelAdmin):
    inlines = [DesignInline]
    list_display = ['title']


class InterviewInline(admin.StackedInline):
    model = InterviewDetail


@admin.register(Interview)
class InterviewAdmin(admin.ModelAdmin):
    inlines = [InterviewInline]
    list_display = ['title']


class PopularInline(admin.StackedInline):
    model = PopularDetail


@admin.register(Popular)
class PopularAdmin(admin.ModelAdmin):
    inlines = [PopularInline]
    list_display = ['title', 'category']
