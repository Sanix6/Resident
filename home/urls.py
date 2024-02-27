from django.urls import path
from .views import *
urlpatterns = [
    path('list/about', AboutAPIView.as_view(), name='list-about'),
    path('about/<str:slug>', AboutDetailAPIView.as_view, name='detail-about'),
    path('list/header', HeaderAPIView.as_view(), name='list-header'),
    path('subheader/<int:pk>', SubHeaderSerializers.as_view(), name='detail-header')
    
]