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
            'category',
            'image',
            'title',
            'data',
            'description',
            'last_mod',
        ]


class HolidaySerializers(serializers.ModelSerializer):
    class Meta:
        model = Holiday
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'description',
            'last_mod',
        ]


class ProductSerializers(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'description',
            'last_mod',
        ]


class DesignSerializers(serializers.ModelSerializer):
    class Meta:
        model = Design
        fields = [
            'slug',
            'category',
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
            'category',
            'image',
            'title',
            'data',
            'last_mod',
        ]


class PopularSerializers(serializers.ModelSerializer):
    class Meta:
        model = Popular
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod'
        ]
# class AllSerislializer(serializers.ModelSerializer):
#     interview = InterviewSerializers(many=True, source='set_interview')
#
#     class Meta:
#         model =
#         fields = ['interview']
