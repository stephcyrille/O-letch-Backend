from django.conf.urls import url
from .views import ProjectStarterList, ProjectDetail


urlpatterns = [
	url(r'^project/base/$', ProjectStarterList.as_view()),
	url(r'^project/(?P<username>[\w-]+)/$', ProjectDetail.as_view()),
]