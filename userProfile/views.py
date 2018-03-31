from .models import UserProfile
from django.http import Http404
from django.contrib.auth.models import User

from .serializer import ProfileSerializer

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny



class ProfileList(APIView):
    """
        Creation of the class in wich we would perform
        all the API actions (GET, POST, DELETE)
    """
    def post(self, request, format=None):
        serializer = ProfileSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        profile = self.get_object(pk)
        profile.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class ProfileDetail(APIView):
    permission_classes = (AllowAny,)

    def get_object(self, username):
        name = str(username)
        try:
            return User.objects.get(username=name)
        except User.DoesNotExist:
            raise  Http404

    def get(self, request, username, format=None):
        user = self.get_object(username)
        profile = UserProfile.objects.get(user_id=user.pk)
        serializer = ProfileSerializer(profile)
        return Response(serializer.data)