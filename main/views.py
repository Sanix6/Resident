from django.shortcuts import render
from .models import *
from .serializers import *
from rest_framework import generics
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter
from .models import Resident



class SliderAPIView(generics.ListAPIView):
    queryset = Slider.objects.all()
    serializer_class = SliderSerializers


class ResidentAPIView(generics.ListAPIView):
    queryset = Resident.objects.all()
    serializer_class = ResidentSerializers
    filter_backends = [DjangoFilterBackend, SearchFilter]
    lookup_field = 'slug'
    filterset_fields = ['category__name']
    search_fields = ['title']
    


class ResidentDetailAPIView(generics.RetrieveAPIView):
    queryset = Resident.objects.all()
    serializer_class = ResidentSerializers
    lookup_field = 'slug'



class CategoryAPIView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategorySerializers


class SubCategoriesListView(generics.ListAPIView):
    queryset = SubCategory.objects.all()
    serializer_class = SubCategoriesListSerializer
    lookup_field = 'slug'



class HeaderAPIView(generics.ListAPIView):
    queryset = Header.objects.all()
    serializer_class = HeaderSerializers



class SubHeaderAPIView(generics.RetrieveAPIView):
    queryset = SubHeader.objects.all()
    serializer_class = SubHeaderSerializers
    lookup_field = 'slug'



