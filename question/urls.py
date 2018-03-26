from django.conf.urls import url
from .views import QuestionList, AnswerDetail, AnswerList


urlpatterns = [
	url(r'^questions/$', QuestionList.as_view()),
	url(r'^questions/(?P<pk_question>[0-9]+)/answers/(?P<pk_answer>[0-9]+)/user/(?P<pk_user>[0-9]+)/$', AnswerDetail.as_view()),
	url(r'^questions/(?P<pk>[0-9]+)/answers/$', AnswerList.as_view()),
]