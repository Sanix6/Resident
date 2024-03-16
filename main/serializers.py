from rest_framework import serializers
from .models import *
from googletrans import Translator
from django.contrib.auth.models import User
import locale
locale.setlocale(category=locale.LC_ALL)


translator = Translator()


class SliderSerializer(serializers.ModelSerializer):
    img = serializers.SerializerMethodField()

    class Meta:
        model = Slider
        fields = ['img', 'title', 'description']

    def get_img(self, obj):
        if obj.img:
            return f"https://resident.kg{obj.img.url}"

class PostSliderSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostSlider
        fields = [
            'image'
        ]


class PostDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostDetail
        fields = [
            'description'
        ]

class PostFileSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostFile
        fields = [
            'title', 'file'
        ]



class CommentSerializer(serializers.ModelSerializer): 
    class Meta:
        model = Comments
        fields = ['post', 'user', 'comment', 'created_at']

        def create(self, validated_data):
            return Comments.objetcs.created(**validated_data)


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['tag', 'slug']


class PostSerializer(serializers.ModelSerializer):
    comment = CommentSerializer(many=True)
    detail = PostDetailSerializer(many=True,read_only=True)
    slider = PostSliderSerializer(many=True, read_only=True)
    exception = PostFileSerializer(many=True, read_only=True)
    cat_title = serializers.SerializerMethodField()
    img = serializers.SerializerMethodField()
    views = serializers.SerializerMethodField()
    created_at = serializers.DateTimeField(format='%H:%M %d.%m.%Y')
    updated_at = serializers.DateTimeField(format='%H:%M %d.%m.%Y')
    user = serializers.SerializerMethodField()
    tags = serializers.PrimaryKeyRelatedField(queryset=Tag.objects.all(), many=True)
    

    def get_user(self, obj):
        if obj.user:
            return f'{obj.user.last_name} {obj.user.first_name}'
        return None
    
    class Meta:
        model = Post
        fields = ['id', 'user', 'slug', 'cat_title', 'cat', 'is_save', 'is_main','sub_cat', 'title', 'img', 'tags','is_active', 'created_at', 'updated_at','slider', 'exception', 'views', 'comment',  'detail']
    
    def to_representation(self, instance):
        data = super().to_representation(instance)
        serialized_tags = TagSerializer(instance.tags, many=True).data
        data['tags'] = serialized_tags
        return data

    def get_img(self, obj): 
        if obj.img:
            return f"https://resident.kg{obj.img.url}"
        
    def get_cat_title(self, obj):
        if obj.cat:
            return obj.cat.title

    def get_views(self, obj):
        a = obj.views
        if a >= 10000 and a < 1000000:
            return f'{int(a/1000)}к'
        
        if a >= 1000000:
            return f'{int(a/1000000)}млн'
        return a

    
class SubCatHeader(serializers.ModelSerializer):
    class Meta:
        model = SubCategory
        fields = [
            'title',
            'slug',
            ]
        

class CatHeaderSerializer(serializers.ModelSerializer):
    subcategory = SubCatHeader(many=True, read_only=True)
    status = serializers.SerializerMethodField()

    class Meta:
        model = Category
        fields = [
            'id',
            'status',
            'title',
            'slug',
            'is_active',
            'subcategory',
            
        ]

    def get_status(self, obj):
        if obj.subcategory.first():
            return False
        else:
            True

    



    