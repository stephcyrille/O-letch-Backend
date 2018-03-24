from django.conf.urls import url
from .views import QuestionList


urlpatterns = [
	url(r'^questions/$', QuestionList.as_view()),
]