from django.conf.urls import url
from .views import ProfileList, ProfileDetail


urlpatterns = [
	url(r'^profiles/$', ProfileList.as_view()),
	url(r'^profiles/(?P<pk_p>[0-9]+)/user/(?P<pk>[0-9]+)/$', ProfileDetail.as_view()),
]