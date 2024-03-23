from django.core.exceptions import ObjectDoesNotExist
from rest_framework.permissions import AllowAny
from django_filters.rest_framework import DjangoFilterBackend
# DRF
from rest_framework import status, generics
from rest_framework.views import APIView
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.filters import SearchFilter
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework import status
# Proj
from .models import *
from .serializers import *
from .paginations import CategoryPagination


class SliderView(generics.ListAPIView):
    serializer_class = SliderSerializer

    def get(self, request, *args, **kwargs):
        model = Slider.objects.filter(language=self.kwargs["lang"])
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)


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
            print(categories)
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
            for cat in categories:
                if lang == 'kg':
                    cat_name = title_mapping.get(cat.title, cat.slug.replace('-', '_'))
                else:
                    cat_name = title_mapping.get(cat.title, cat.title) 
                model = Post.objects.filter(cat=cat, language=lang)
                serialized_post = PostSerializer(model, many=True).data
                response[cat_name] = serialized_post
            
            return Response(response)
        except ObjectDoesNotExist:
            return Response({'error': 'Post is not found'}, status=status.HTTP_404_NOT_FOUND)
        
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


class HeaderView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CatHeaderSerializer

    def get(self, request, *args, **kwargs):
        model = Category.objects.filter(language=self.kwargs["lang"], is_active=True)
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
        
    # def list(self, request, *args, **kwargs):
    #     queryset = self.get_queryset()
    #     if not queryset.exists():
    #         return Response(data=None, status=status.HTTP_200_OK)
    #     serializer = self.get_serializer(queryset, many=True)
    #     return Response(serializer.data)

    # def post(self, request, format=None):
    #     serializer = PostFileSerializer(data=request.data)
    #     if serializer.is_valid():
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #     return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)