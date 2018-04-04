from django.conf.urls import url, include
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static

from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token, verify_jwt_token



urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/', include('news.urls')),
    url(r'^api/', include('question.urls')),
    url(r'^api/', include('userProfile.urls')),
    url(r'^api/', include('project.urls')),
    url(r'^api/auth/login', obtain_jwt_token),
    url(r'^api/auth/refresh', refresh_jwt_token),
    url(r'^api/auth/verify', verify_jwt_token),
]


if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)