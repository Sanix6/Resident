from django.shortcuts import render
from .models import *
from .serializers import *
from rest_framework import generics


class SliderAPIView(generics.ListAPIView):
    queryset = Slider.objects.all()
    serializer_class = SliderSerializers


class EstateAPIView(generics.ListAPIView):
    queryset = Estate.objects.all()
    serializer_class = EstateSerializers
    lookup_field = 'slug'


class EstateDetailAPIView(generics.RetrieveAPIView):
    queryset = Estate.objects.all()
    serializer_class = EstateSerializers
    lookup_field = 'slug'


class HolidayAPIView(generics.ListAPIView):
    queryset = Holiday.objects.all()
    serializer_class = HolidaySerializers
    lookup_field = 'slug'


class HolidayDetailAPIView(generics.RetrieveAPIView):
    queryset = Holiday.objects.all()
    serializer_class = HolidaySerializers
    lookup_field = 'slug'


class ProductAPIView(generics.ListAPIView):
    queryset = Product.objects.all()
    serializer_class = HolidaySerializers
    lookup_field = 'slug'


class ProductDetailAPIView(generics.RetrieveAPIView):
    queryset = Product.objects.all()
    serializer_class = HolidaySerializers
    lookup_field = 'slug'


class DesignAPIView(generics.ListAPIView):
    queryset = Design.objects.all()
    serializer_class = DesignSerializers
    lookup_field = 'slug'


class DesignDetailAPIView(generics.RetrieveAPIView):
    queryset = Design.objects.all()
    serializer_class = DesignSerializers
    lookup_field = 'slug'


class InterViewAPIView(generics.ListAPIView):
    queryset = Interview.objects.all()
    serializer_class = InterviewSerializers
    lookup_field = 'slug'


class InterViewDetailAPIView(generics.RetrieveAPIView):
    queryset = Interview.objects.all()
    serializer_class = InterviewSerializers
    lookup_field = 'slug'
