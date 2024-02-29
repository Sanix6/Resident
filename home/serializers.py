from rest_framework import serializers
from .models import *
from main.serializers import ResidentSerializers
from googletrans import Translator

translator = Translator()

class AboutDetailSerializers(serializers.ModelSerializer):
    class Meta:
        model = AboutDetail
        fields = [
            'slug',
            'title',
            'category',
            'description',
            'img',
            'last_mood'
        ]


class AboutSerializers(serializers.ModelSerializer):
    about = AboutDetailSerializers(source='key', many=True)
    class Meta:
        model = About
        fields = [
            'slug',
            'title',
            'category',
            'img',
            'last_mood',
            'about'
        ]

