from rest_framework import serializers
from .models import *


class SliderSerializers(serializers.ModelSerializer):
    class Meta:
        model = Slider
        fields = ['image', 'title', 'description']


class EstateSerializers(serializers.ModelSerializer):
    class Meta:
        model = Estate
        fields = [
            'slug',
            'image',
            'title',
            'data',
            'last_mod',
        ]


class HolidaySerializers(serializers.ModelSerializer):
    class Meta:
        model = Holiday
        fields = [
            'slug',
            'image',
            'title',
            'data',
            'last_mod',
        ]


class ProductSerializers(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = [
            'slug',
            'image',
            'title',
            'data',
            'last_mod',
            ]


class DesignSerializers(serializers.ModelSerializer):
    class Meta:
        model = Design
        fields = [
            'slug',
            'image',
            'title',
            'data',
            'last_mod',
            ]


class InterviewSerializers(serializers.ModelSerializer):
    class Meta:
        model = Interview
        fields = [
            'slug',
            'image',
            'title',
            'data',
            'last_mod',
            ]