from django.urls import path
from .models import *
from .views import *
from .sitemaps import *

urlpatterns = [
    path('<str:lang>/list/slider/', SliderAPIView.as_view(), name='list-slider'),
    path('<str:lang>/list/resident/', ResidentAPIView.as_view(), name='list-resident'),
    path('resident/<str:slug>/', ResidentDetailAPIView.as_view(), name='detail-resident'),
    path('<str:lang>/list/category/', CategoryAPIView.as_view(), name='list-category'),
    path('<str:lang>/subheader/<str:slug>/', SubHeaderAPIVIew.as_view(), name='subheader-detail'),
    path('<str:lang>/list/cat/', CategoriesAPIView.as_view(), name='categories'),

    # Sitemap
    path("sitemap.xml", SitemapView.as_view(), name="sitemap")

]