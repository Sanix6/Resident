from django.core.exceptions import ObjectDoesNotExist
from django_filters.rest_framework import DjangoFilterBackend
from googletrans import Translator

# DRF
from rest_framework import status, generics
from rest_framework.views import APIView
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.filters import SearchFilter
from rest_framework import status
from rest_framework.exceptions import NotFound
import random
from collections import defaultdict

# Proj
from .models import *
from .serializers import *
from .paginations import CategoryPagination
from .forms import *



class SubCatDataView(generics.ListAPIView):
    serializer_class = PostSerializer

    def get_queryset(self):
        return Post.objects.filter(language=self.kwargs["lang"], sub_cat__slug=self.kwargs["slug"])

    def get(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.serializer_class(queryset, many=True)
        return Response(serializer.data)
    
    
class PostDetailView(APIView):
    def get(self, request, slug):
        try:
            queryset = Post.objects.get(slug=slug)
            serializer = PostSerializer(queryset, context={'request': request})
            similar = Post.objects.filter(cat=queryset.cat).order_by("-views")[:31]
            similar_serializer = PostSerializer(similar, many=True, context={'request': request})

            data = serializer.data
            data['similar_posts'] = similar_serializer.data

            queryset.views += 1
            queryset.save()

            return Response(data)
        except Post.DoesNotExist:
            return Response({'error': 'Post is not found'}, status=status.HTTP_404_NOT_FOUND)      

class PostView(APIView):
    filter_backends = [SearchFilter]
    search_fields = ['title', 'sub_cat']

    def get(self, request, *args, **kwargs):
        try:
            lang = self.kwargs["lang"]
            categories = Category.objects.filter(language=lang)
            response = {}

            title_mapping = {
                "Популярные": "Popularnye",
                "Недвижимость": "Nedvizhimost",
                "Интервью": "Interviews",
                "Продукты": "Products",
                "Предложение от компании": "CompanyOffer",
                "Раскошный отдых": "LuxuryVacation",
                "Маектешуу": "Interviews",
                "Компаниядан сунуштар": "CompanyOffer",
                "Люкс майрам": "LuxuryVacation",
                "Кыймылсыз мулк": "Nedvizhimost",
                "Популярдуу": "Popularnye",
                "Продукттар": 'Products'
            }

            translator = Translator()

            for cat in categories:
                if lang == 'kg':
                    cat_name = title_mapping.get(cat.title, cat.slug.replace('-', '_'))
                else:
                    if cat.title in title_mapping:
                        cat_name = title_mapping[cat.title]
                    else:
                        translated = translator.translate(cat.title, src='ru', dest='en')
                        cat_name = translated.text.replace(' ', '_')

                model = Post.objects.filter(cat=cat, language=lang)
                serialized_post = PostSerializer(model, many=True).data
                response[cat_name] = serialized_post

            return Response(response)
        except Category.DoesNotExist:
            raise NotFound('Category not found')
        except Post.DoesNotExist:
            raise NotFound('Post not found')
        

    def get_queryset(self):
        queryset = Post.objects.all().order_by('-views') 
        return queryset
    
    def search_posts_by_tag(self, tag_query):
        posts_with_tag = Post.objects.filter(tags__icontains=tag_query)
        response = []
        for post in posts_with_tag:
            serialized_post = PostSerializer(post).data
            post_detail = PostDetail.objects.filter(main=post, description__icontains=tag_query).first()
            if post_detail:
                serialized_post['detail'] = PostDetailSerializer(post_detail).data
            response.append(serialized_post)
        
        return response

class StatusView(APIView):
    serializer_class = StatusSerializer
    filter_backends = [SearchFilter]
    search_fields = ['blog', 'post__title']

    def get(self, request, *args, **kwargs):
        try:
            lang = self.kwargs["lang"]
            model = Status.objects.filter(language=lang)
            serialized_status = self.serializer_class(model, many=True).data
            status_dict = {}
            for status in serialized_status:
                translated_blog_name = list(status.keys())[0]
                status_posts = status.pop(translated_blog_name)
                status_dict[translated_blog_name] = status_posts
            return Response(status_dict)
        except ObjectDoesNotExist:
            return Response({'error': 'Status is not found'}, status=status.HTTP_404_NOT_FOUND)
        
    def get_queryset(self):
        queryset = Status.objects.all()
        return queryset



class HeaderView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CatHeaderSerializer

    def get(self, request, *args, **kwargs):
        model = Category.objects.filter(language=self.kwargs["lang"], is_active=True)[:6]
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)

    
class InCatView(APIView):
    serializer_class = PostSerializer
    pagination_class = CategoryPagination

    def get(self, request, *args, **kwargs):
        lang = self.kwargs["lang"]
        cat = self.kwargs["cat_slug"]

        model = Post.objects.filter(language=lang, cat__slug=cat)
        paginator = self.pagination_class()
        result_page = paginator.paginate_queryset(model, request)
        return paginator.get_paginated_response(self.serializer_class(result_page, many=True).data)



class CommentView(APIView):
    def post(self, request, *args, **kwargs):
        serializer = CommentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

    def get_queryset(self, requests):
        return Comments.objects.filter(is_active=True)
    

    def get(self, request, *args, **kwargs):
        comments = Comments.objects.all()
        serializer = CommentSerializer(comments, many=True)
        return Response(serializer.data)



class PostSliderView(APIView):
    def get(self, request, slug):
        try:
            queryset = Post.objects.get(slug=slug)
            serializer = PostSerializer(queryset, context={'request': request})
            queryset.save()

            return Response(serializer.data)
        except ObjectDoesNotExist:
            return Response({'error': 'Post is not found'}, status=status.HTTP_404_NOT_FOUND)


class PostFileView(APIView):
    def get(self, request, slug):
        try:
            queryset = Post.objects.get(slug=slug)
            serializer = PostSerializer(queryset, context={'request': request})
            queryset.save()
            return Response(serializer.data)
        except ObjectDoesNotExist:
            return Response({'error': 'Post is not found'}, status=status.HTTP_404_NOT_FOUND)
    

class BannerView(APIView):
    def get(self, request, *args, **kwargs):
        now = timezone.now()
        
        banners = Banner.objects.filter(date__gte=now)
        grouped_banners = defaultdict(list)
        for banner in banners:
            grouped_banners[banner.blog].append(banner)
        
        response_data = {}
        for blog, banners in grouped_banners.items():
            random_banner = random.choice(banners)
            serialized_banner = BannerSerializer(random_banner).data
            blog_key = serialized_banner.pop('blog')
            response_data[blog_key] = serialized_banner
        return Response(response_data)