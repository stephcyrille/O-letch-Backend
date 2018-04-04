from django.conf.urls import url
from .views import ProfileList, ProfileDetail, ProfileDetailById


urlpatterns = [
	url(r'^profiles/$', ProfileList.as_view()),
	url(r'^profiles/(?P<username>[\w-]+)/$', ProfileDetail.as_view()),
	url(r'^profiles/byId/(?P<pk>[0-9]+)/$', ProfileDetailById.as_view()),
]