from django.contrib import admin
from .models import *


class AboutInline(admin.StackedInline):
    model = AboutDetail


@admin.register(About)
class AboutAdmin(admin.ModelAdmin):
    inlines = [AboutInline]
    list_display = ['title']


