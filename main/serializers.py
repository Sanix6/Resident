from rest_framework import serializers
from .models import *



class SliderSerializers(serializers.ModelSerializer):
    class Meta:
        model = Slider
        fields = ['image', 'title', 'description']




class EstateDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = EstateDetail
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'name',
            'description'
        ]



class EstateSerializers(serializers.ModelSerializer):
    estate = EstateDetailSerializers(many=True, read_only=True)
    class Meta:
        model = Estate
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'estate',
        ]



class HolidayDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = HolidayDetail
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'name',
            'description'
        ]




class HolidaySerializers(serializers.ModelSerializer):
    holiday = HolidayDetailSerializers(many=True, read_only=True)
    class Meta:
        model = Holiday
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'holiday',
        ]



class ProductDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = ProductDetail
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'name',
            'description'
        ]



class ProductSerializers(serializers.ModelSerializer):
    product = ProductDetailSerializers(many=True, read_only=True)
    class Meta:
        model = Product
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'product',
        ]



class DesignDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = DesignDetail
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'name',
            'description'
        ]



class DesignSerializers(serializers.ModelSerializer):
    design = DesignDetailSerializers(many=True, read_only=True)
    class Meta:
        model = Design
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'design',
        ]


class InterviewDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = InterviewDetail
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'name',
            'description'
        ]


class InterviewSerializers(serializers.ModelSerializer):
    interview = InterviewDetailSerializers(many=True, read_only=True)
    class Meta:
        model = Interview
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'interview'
        ]


class PopularDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = PopularDetail
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'name',
            'description'
        ]



class PopularSerializers(serializers.ModelSerializer):
    popular = PopularDetailSerializers(many=True, read_only=True)
    class Meta:
        model = Popular
        fields = [
            'slug',
            'category',
            'image',
            'title',
            'data',
            'last_mod',
            'popular',
            
        ]
