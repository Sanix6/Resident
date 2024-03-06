from django.shortcuts import render
from .models import *
from .serializers import *
from rest_framework import generics, views
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.filters import SearchFilter
from .models import Resident
from django.core.exceptions import ObjectDoesNotExist
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView



class SliderAPIView(generics.ListAPIView):
    serializer_class = SliderSerializers

    def get(self, request, *args, **kwargs):
        model = Slider.objects.filter(language=self.kwargs["lang"])
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)


class ResidentAPIView(APIView):
    serializer_class = ResidentSerializers

    def get(self, request, *args, **kwargs):
        model = Category.objects.filter(language=self.kwargs["lang"])
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)
    
    

class ResidentDetailAPIView(APIView):
    def get(self, request, slug):
        try:
            queryset = Resident.objects.get(slug=slug)
            serializer = ResidentSerializers(queryset, context={'request': request})

            queryset.views += 1
            queryset.save()

            return Response(serializer.data)
        except ObjectDoesNotExist:
            return Response({'error': 'Resident not found'}, status=status.HTTP_404_NOT_FOUND)



class CategoryAPIView(APIView):
    serializer_class = CategorySerializers
    
    def get(self, request, *args, **kwargs):
        model = Category.objects.filter(language=self.kwargs["lang"])
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)


class CategoriesAPIView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CategoryListSerializers

    def get(self, request, *args, **kwargs):
        model = Category.objects.filter(language=self.kwargs["lang"])
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)
    
    

class SubHeaderAPIVIew(generics.ListAPIView):
    queryset = SubHeader.objects.all()
    serializer_class = SubHeaderSerializers
    lookup_field = 'slug'

    def get(self, request, *args, **kwargs):
        model = SubHeader.objects.filter(language=self.kwargs["lang"])
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)


    