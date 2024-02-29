from rest_framework import serializers
from ckeditor.widgets import CKEditorWidget
from .models import *
from googletrans import Translator

translator = Translator()



class SliderSerializers(serializers.ModelSerializer):
    class Meta:
        model = Slider
        fields = [
            'image', 
            'title',
            'description'
            ]

# class PublicationStatusSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = PublicationStatus
#         fields = ('is_active', 'is_draft')



class ResidentDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = ResidentDetail
        fields = [
            'description'
        ]
    


class ResidentSerializers(serializers.ModelSerializer):
    resident = ResidentDetailSerializers(many=True,read_only=True)
    # publication_status = PublicationStatusSerializer(read_only=True)
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
            'lang',
            'updated_at',
            'resident',
        ]

    def get_category_name(self, obj):
        return obj.category.name if obj.category else None
    

    # def create(self, validated_data):
    #     publication_status_data = validated_data.pop('publication_status')
    #     resident = Resident.objects.create(**validated_data)
    #     PublicationStatus.objects.create(resident=resident, **publication_status_data)
    #     return resident

    # def update(self, instance, validated_data):
    #     publication_status_data = validated_data.pop('publication_status', {})
    #     publication_status = instance.publication_status

    #     instance = super().update(instance, validated_data)

    #     publication_status.is_active = publication_status_data.get('is_active', publication_status.is_active)
    #     publication_status.is_draft = publication_status_data.get('is_draft', publication_status.is_draft)
    #     publication_status.save()

    #     return instance
    

class SubCategoriesListSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = [
            'title', 
            ]


class CategorySerializers(serializers.ModelSerializer):
    state = ResidentSerializers(many=True, read_only=True)
    key = SubCategoriesListSerializer(many=True, read_only=True)

    class Meta:
        model = Category
        fields = [
            'name',
            'state',
            'key',
        ]

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
    class Meta:
        model = SubHeader
        fields = [
            'slug',
            'title',
        ]



class HeaderSerializers(serializers.ModelSerializer):
    key = SubHeaderSerializers(many=True, read_only=True)

    class Meta:
        model = Header
        fields = [
            'id',
            'title',
            'key',

        ]
    





    






