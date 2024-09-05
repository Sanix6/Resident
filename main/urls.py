from django.urls import path
from .sitemaps import *
from .views import *


urlpatterns = [
    path('post/<str:slug>/', PostDetailView.as_view(), name='post-detail'),
    path('<str:lang>/sub-cat/<str:slug>/', SubCatDataView.as_view(), name='sub-cat-data'),
    path('<str:lang>/list', PostView.as_view(), name='post-list'),  # Search
    path('<str:lang>/header', HeaderView.as_view(), name='header-param'),
    path('<str:lang>/<str:cat_slug>', InCatView.as_view(), name='cat-detail'),
    path('comment/', CommentView.as_view(), name='comment'),
    path('slider/<str:slug>/', PostSliderView.as_view(),),
    path('file/<str:slug>/', PostFileView.as_view()),
    path('<str:lang>/list/status', StatusView.as_view(), name='status'),
    path('baner', BannerView.as_view(), name='baner'),
    
    
    #sitemap
    path("sitemap.xml", SitemapView.as_view(), name="sitemap")

]
