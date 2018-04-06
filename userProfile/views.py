from django.http import Http404
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404

from .models import UserProfile, UserAvatar
from .serializer import ProfileSerializer, ProfilePostSerializer, UserSerializer, UserAvatarSerializer

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework.parsers import MultiPartParser, FormParser




class ProfileList(APIView):
    """
        Creation of the class in wich we would perform
        all the API actions (GET, POST, DELETE)
    """
    parser_classes = (MultiPartParser, FormParser)
    permission_classes = (AllowAny,)

    def post(self, request, *args, **kwargs):
        serializer = ProfilePostSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        profile = UserProfile.objects.get(pk=pk)
        profile.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



class UserList(APIView):
    """
        Creation of the class in wich we would perform
        all the API actions (GET, POST, DELETE)
    """
    permission_classes = (AllowAny,)
    def post(self, request, format=None):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        user = get_object_or_404(User, pk=pk)
        user.delete()
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
        name = str(username)
        user = get_object_or_404(User, username=name)
        profile = get_object_or_404(UserProfile, user_id=user.pk)
        serializer = ProfileSerializer(profile)
        return Response(serializer.data)


class ProfileDetailById(APIView):
    permission_classes = (AllowAny,)

    def get(self, request, pk, format=None):
        profile = get_object_or_404(UserProfile, pk=pk)
        serializer = ProfileSerializer(profile)
        return Response(serializer.data)


class UserAvatarDetailById(APIView):
    permission_classes = (AllowAny,)

    def get_object(self, pk):
        try:
            return UserProfile.objects.get(pk=pk)
        except UserProfile.DoesNotExist:
            raise  Http404

    def get(self, request, pk, format=None):
        profile = self.get_object(pk)
        userAvatar = get_object_or_404(UserAvatar, user_id=profile.pk)
        serializer = UserAvatarSerializer(userAvatar)
        return Response(serializer.data)