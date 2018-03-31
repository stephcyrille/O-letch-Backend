from django.conf.urls import url
from .views import ArticleList


urlpatterns = [
	url(r'^articles/$', ArticleList.as_view()),
]