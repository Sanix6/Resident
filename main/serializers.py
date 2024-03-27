from rest_framework import serializers
from .models import *
from googletrans import Translator
from django.contrib.auth.models import User
import locale
locale.setlocale(category=locale.LC_ALL)


translator = Translator()


class SliderSerializer(serializers.ModelSerializer):
   # img = serializers.SerializerMethodField()

    class Meta:
        model = Slider
        fields = ['img', 'title', 'url', 'description']

  #  def get_img(self, obj):
 #       if obj.img:
#            return f"https://resident.kg{obj.img.url}"



class PostSliderSerializer(serializers.ModelSerializer):
    #image = serializers.SerializerMethodField()
    class Meta:
        model = PostSlider
        fields = [
            'image'
        ]

   # def get_image(self, obj):
     #   return f"https://resident.kg{obj.image.url}"


class PostDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = PostDetail
        fields = [
            'description',
        ]


class PostFileSerializer(serializers.ModelSerializer):
    file = serializers.SerializerMethodField()

    class Meta:
        model = PostFile
        fields = [
            'title', 'file'
        ]

    def get_file(self, obj):
        return f"https://resident.kg{obj.file.url}"



class CommentSerializer(serializers.ModelSerializer): 
    class Meta:
        model = Comments
        fields = ['post', 'user', 'comment', 'created_at', 'is_active']

    def create(self, validated_data):
        return Comments.objects.create(**validated_data)



class PostSerializer(serializers.ModelSerializer):
    comment = CommentSerializer(many=True)
    detail = PostDetailSerializer(many=True,read_only=True)
    slider = PostSliderSerializer(many=True, read_only=True)
    exception = PostFileSerializer(many=True, read_only=True)
    cat_title = serializers.SerializerMethodField()
    #img = serializers.SerializerMethodField()
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
        fields = ['id', 'user', 'slug', 'cat_title', 'cat', 'is_save', 'is_main',
                  'sub_cat', 'title', 'img', 'tags','is_active', 'created_at', 
                  'updated_at','slider', 'exception', 'views', 'comment',  'detail']
    

#    def get_img(self, obj): 
#        if obj.img:
#            return f"https://resident.kg{obj.img.url}"
        
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

    



    
