from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from .yasg import urlpatterns as yasg_url
from django.conf import settings


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('main.urls')),
    path('', include('home.urls')),
    # path('ckeditor/', include('ckeditor_uploader.urls')),
    # path("ckeditor5/", include('django_ckeditor_5.urls'), name="ck_editor_5_upload_file"),

]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += yasg_url

