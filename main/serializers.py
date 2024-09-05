from rest_framework import serializers
from .models import *
from googletrans import Translator
from django.contrib.auth.models import User
from googletrans import Translator
import locale
from django.utils import timezone
from datetime import datetime, date
locale.setlocale(category=locale.LC_ALL)


translator = Translator()

BANNER = (
    ('Главное', 'Main'),
    ('Популярные', 'Popular'),
    ('Недвижимость', 'RealEstate'),
    ('Раскошный отдых', 'LuxuryVacation'),
    ('Продукты', 'Products'),
    ('Интервью', 'Interviews'),
    ('Предложение от компании', 'CompanyOffers'),
    ('Башкы', 'Kg_Main'),
    ("Маектешуу", "Kg_Interviews"),
    ("Компаниядан сунуштар","Kg_CompanyOffers"),
    ("Люкс майрам", "Kg_LuxuryVacation"),
    ("Кыймылсыз мулк", "Kg_RealEstate"),
    ("Популярдуу", "Kg_Popular"),
    ("Продукттар", 'Kg_Products'),
)

class BannerSerializer(serializers.ModelSerializer):
    blog = serializers.SerializerMethodField()
    url = serializers.SerializerMethodField()

    class Meta:
        model = Banner
        fields = ['blog', 'pc_image', 'mb_img', 'url', 'date']

    def get_blog(self, obj):
        translations = dict(BANNER)
        return translations.get(obj.blog, obj.blog)

    def get_url(self, obj):
        return obj.url


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
    # file = serializers.SerializerMethodField()

    class Meta:
        model = PostFile
        fields = [
            'title', 'file'
        ]

    # def get_file(self, obj):
    #     return f"https://resident.kg"



class CommentSerializer(serializers.ModelSerializer):
    date = serializers.SerializerMethodField(read_only=True)
    class Meta:
        model = Comments
        fields = ['post', 'user', 'comment', 'date', 'is_active']

    def create(self, validated_data):
        return Comments.objects.create(**validated_data)
    
    def get_date(self, obj):
        if obj.created_at:
            return obj.created_at.strftime('%Y-%m-%d')



class PostSerializer(serializers.ModelSerializer):
    comment = CommentSerializer(many=True)
    detail = PostDetailSerializer(many=True,read_only=True)
    slider = PostSliderSerializer(many=True, read_only=True)
    exception = PostFileSerializer(many=True, read_only=True)
    cat_title = serializers.SerializerMethodField()
    views = serializers.SerializerMethodField()
    created_at = serializers.DateTimeField(format='%H:%M %d.%m.%Y')
    updated_at = serializers.DateTimeField(format='%H:%M %d.%m.%Y')
    user = serializers.SerializerMethodField()


    def get_user(self, obj):
        if obj.user:
            return f'{obj.user.last_name} {obj.user.first_name}'
        return None
    
    def to_representation(self, instance):
        representation = super().to_representation(instance)
        if not representation['exception']:
            representation['exception'] = None
        return representation

    class Meta:
        model = Post
        fields = ['id', 'user', 'slug', 'cat_title', 'cat', 'is_main',
                  'sub_cat', 'title', 'img', 'tags','is_active', 'created_at', 
                  'updated_at', 'slider', 'exception', 'views', 'comment',  'detail']
    
        
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
    
class StatusSerializer(serializers.ModelSerializer):
    posts = serializers.SerializerMethodField()
    
    def get_posts(self, obj):
        posts = Post.objects.filter(status=obj)
        serialized_posts = PostSerializer(posts, many=True).data
        return serialized_posts

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        blog_value = representation.pop('blog')
        english_blog_value = self.translate_to_english(blog_value)
        english_blog_value = english_blog_value.replace(' ', '_')
        representation[english_blog_value] = representation.pop('posts')
        return representation

    def translate_to_english(self, text):
        translator = Translator()
        translation = translator.translate(text, dest='en')
        return translation.text.replace('_', ' ')
    

    class Meta:
        model = Status
        fields = [ 'blog', 'posts']

    
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

    



    
