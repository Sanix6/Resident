from django.shortcuts import render
from .models import *
from .serializers import *
from rest_framework import generics
from rest_framework.response import Response
from django.db.models import F




class SliderAPIView(generics.ListAPIView):
    queryset = Slider.objects.all()
    serializer_class = SliderSerializers


class ResidentAPIView(generics.ListAPIView):
    queryset = Resident.objects.all()
    serializer_class = ResidentSerializers
    lookup_field = 'slug'
    search_filter = ['category', 'title']
    


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
