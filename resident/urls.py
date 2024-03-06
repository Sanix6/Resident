from django.contrib import admin
from django.urls import path, include, re_path
from django.conf.urls.static import static
from .yasg import urlpatterns as yasg_url
from django.conf import settings
from django.contrib.sitemaps import GenericSitemap
from django.contrib.sitemaps.views import sitemap
from main.models import *

info_dict = {
    "queryset": Resident.objects.all(),
    "date_field": "pub_date",
}

urlpatterns = [
    path('api/admin/', admin.site.urls),
    path('api/', include('main.urls')),
    # path('api/', include('users.urls')),
    path('ckeditor/', include('ckeditor_uploader.urls')),
    re_path('api/chaining/', include('smart_selects.urls')),
    path(
        "api/sitemap.xml",
        sitemap,
        {"sitemaps": {"blog": GenericSitemap(info_dict, priority=1.0)}},
        name="django.contrib.sitemaps.views.sitesmap",

    ),
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += yasg_url

