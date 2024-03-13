from django_filters.rest_framework import DjangoFilterBackend
from django.core.exceptions import ObjectDoesNotExist
# DRF
from rest_framework import status, generics
from rest_framework.views import APIView
from rest_framework.filters import SearchFilter
from rest_framework.response import Response
from rest_framework.filters import SearchFilter
# Proj
from .models import *
from .serializers import *


class SliderView(generics.ListAPIView):
    serializer_class = SliderSerializer

    def get(self, request, *args, **kwargs):
        model = Slider.objects.filter(language=self.kwargs["lang"])
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)


class PostDetailView(APIView):
    def get(self, request, slug):
        try:
            queryset = Post.objects.get(slug=slug)
            serializer = PostSerializer(queryset, context={'request': request})

            queryset.views += 1
            queryset.save()

            return Response(serializer.data)
        except ObjectDoesNotExist:
            return Response({'error': 'Post is not found'}, status=status.HTTP_404_NOT_FOUND)


class SubCatDataView(generics.ListAPIView):
    serializer_class = PostSerializer

    def get_queryset(self):
        return Post.objects.filter(language=self.kwargs["lang"], sub_cat__slug=self.kwargs["slug"])

    def get(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = self.serializer_class(queryset, many=True)
        return Response(serializer.data)
    

class PostView(APIView):
    filter_backends = [SearchFilter]
    search_fields = ['title', 'sub_cat']

    def get(self, request, *args, **kwargs):
        try:
            lang = self.kwargs["lang"]
            
            categories = Category.objects.filter(language=lang)
            print(categories)
            response = {}
            for cat in categories:
                cat_name = cat.last.slug.replace('-', '_') if cat.language == 'kg' and cat.last else cat.slug.replace('-', '_')
                model = Post.objects.filter(cat=cat, language=lang)
                serialized_post = PostSerializer(model, many=True).data
                response[cat_name] = serialized_post
            
            return Response(response)
        except ObjectDoesNotExist:
            return Response({'error': 'Post is not found'}, status=status.HTTP_404_NOT_FOUND)



class HeaderView(generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = CatHeaderSerializer

    def get(self, request, *args, **kwargs):
        model = Category.objects.filter(language=self.kwargs["lang"], is_active=True)
        serializer = self.serializer_class(model, many=True)
        return Response(serializer.data)
    
    

class InCatView(APIView):
    serializer_class = PostSerializer

    def get(self, request, *args, **kwargs):
        lang = self.kwargs["lang"]
        cat = self.kwargs["cat_slug"]

        model = Post.objects.filter(language=lang, cat__slug=cat)
        return Response(self.serializer_class(model, many=True).data)




class CommentView(APIView):    
    def post(self, request, *args, **kwargs):
        serializer = CommentSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)