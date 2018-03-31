from django.conf.urls import url
from .views import ProfileList, ProfileDetail


urlpatterns = [
	url(r'^profiles/$', ProfileList.as_view()),
	url(r'^profiles/(?P<username>[\w-]+)/$', ProfileDetail.as_view()),
]