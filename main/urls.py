from django.urls import path
from .models import *
from .views import *

urlpatterns = [
    path('list/slider', SliderAPIView.as_view(), name='list-slider'),
    path('list/resident', ResidentAPIView.as_view(), name='list-resident'),
    path('resident/<str:slug>', ResidentDetailAPIView.as_view(), name='detail-resident'),
    path('list/category', CategoryAPIView.as_view(), name='list-category'),
    path("subcategory/<str:slug>", SubCategoriesListView.as_view(), name="sub-categories"),
    path('list/header', HeaderAPIView.as_view(), name='list-header'),
    path('subheader/<str:slug>', SubHeaderAPIView.as_view(), name='detail-header'),
]