from django.urls import path
from . import views


from .views import *
urlpatterns = [
    path('list/about', AboutAPIView.as_view(), name='list-about'),
    path('about/<str:slug>', AboutDetailAPIView.as_view, name='detail-about'),

    
]