from rest_framework import serializers
from ckeditor.widgets import CKEditorWidget
from .models import *
from googletrans import Translator

translator = Translator()



class SliderSerializers(serializers.ModelSerializer):
    image = serializers.SerializerMethodField()

    class Meta:
        model = Slider
        fields = [
            'image', 
            'title',
            'description'
            ]

    def get_image(self, obj):
        if obj.image:
            return f"https://resident.kg{obj.image.url}"


class ResidentDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = ResidentDetail
        fields = [
            'description'
        ]
    


class ResidentSerializers(serializers.ModelSerializer):
    resident = ResidentDetailSerializers(many=True,read_only=True)
    category_name = serializers.SerializerMethodField()

    class Meta:
        model = Resident
        fields = [
            'slug',
            'category_name',
            'image',
            'title',
            'data',
            'save_state',
            'views',
            'updated_at',
            'resident',
        ]

    def get_category_name(self, obj):
        return obj.header.name if obj.header else None
        


class CategorySerializers(serializers.ModelSerializer):
    state = ResidentSerializers(many=True, read_only=True)
    class Meta:
        model = Category
        fields = (
            'slug',
            'name',
            'state',
        )

    def translate_category_name(self, category_name):
        if category_name is None:
            return None
        translation = translator.translate(category_name, dest='en')
        return translation.text.lower().replace(' ', '_')


    def to_representation(self, instance):
        representation = super().to_representation(instance)
        translated_name = self.translate_category_name(representation['name'])
        return {translated_name: representation['state']}

    

class SubHeaderSerializers(serializers.ModelSerializer):
    resident = ResidentSerializers(many=True, read_only=True)
    class Meta:
        model = SubHeader
        fields = [
            'title',
            'slug',
            'resident'
            ]
        

class CategoryListSerializers(serializers.ModelSerializer):
    header = SubHeaderSerializers(many=True, read_only=True)
    class Meta:
        model = Category
        fields = [
            'name',
            'slug',
            'is_active',
            'header',
            
        ]