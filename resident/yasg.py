from django.urls import path
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
# from drf_spectacular.views import SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView

# urlpatterns = [
#     # ...
#     path('api/schema/', SpectacularAPIView.as_view(), name='schema'),
#     path('swagger/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger'),
#     path('api/schema/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
#     # ...
# ]


schema_view = get_schema_view(
    openapi.Info(
        title='Resident',
        default_version='v1',
        description='API for Resident',
        license=openapi.License(name='BSD License'),
    ),
    public=True,
    # permission_classes=(permissions.AllowAny,),
    # url='https://api.navisdevs.ru'
)

urlpatterns = [
    path('docs.json', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    path('swagger/', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    path('redoc/', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc')
]