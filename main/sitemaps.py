from django.contrib import sitemaps
from django.urls import reverse
from django.views.generic import TemplateView
from .models import *
from django.shortcuts import render



class SitemapView(TemplateView):
    template_name = 'sitemapxml.html'
    content_type = "application/xml"

    def get_context_data(self, **kwargs):
        context =  super().get_context_data(**kwargs)
        context["post"] = Post.objects.order_by("updated_at")
        return context

        