from django.conf.urls import url
from .views import ArticleList


urlpatterns = [
	url(r'^news/$', ArticleList.as_view()),
]