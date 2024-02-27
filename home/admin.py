from django.contrib import admin
from .models import *


class AboutInline(admin.StackedInline):
    model = AboutDetail


@admin.register(About)
class AboutAdmin(admin.ModelAdmin):
    inlines = [AboutInline]
    list_display = ['title']


class SubHeaderInline(admin.StackedInline):
    model = SubHeader
    extra = 0


class HeaderAdmin(admin.ModelAdmin):
    inlines = [SubHeader]
    list_display = 'cat'

