from django.shortcuts import render
from .serializers import *
from .models import *
from rest_framework import generics


class AboutAPIView(generics.ListAPIView):
    queryset = About.objects.all()
    serializer_class = AboutSerializers
    lookup_field = 'slug'



class AboutDetailAPIView(generics.RetrieveAPIView):
    queryset = AboutDetail.objects.all()
    serializer_class = AboutDetailSerializers
    lookup_field = 'slug'
