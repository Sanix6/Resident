from django.urls import path
from .models import *
from .views import *

urlpatterns = [
    path('list/slider', SliderAPIView.as_view(), name='list-slider'),
    path('list/estate', EstateAPIView.as_view(), name='list-estate'),
    path('estate/<str:slug>', EstateDetailAPIView.as_view(), name='detail-estate'),
    path('list/holiday', HolidayAPIView.as_view(), name='list-holiday'),
    path('holiday/<str:slug>', HolidayDetailAPIView.as_view(), name='detail-holiday'),
    path('list/product', ProductAPIView.as_view(), name='list-product'),
    path('product/<str:slug>', ProductDetailAPIView.as_view(), name='detail-product'),
    path('list/design', DesignAPIView.as_view(), name='llist-design'),
    path('design/<str:slug>', DesignDetailAPIView.as_view(), name='detail-design'),
    path('list/interview', InterViewAPIView.as_view(), name='list-interview'),
    path('interview/<str:slug>', InterViewAPIView.as_view(), name='detail-interview')

]