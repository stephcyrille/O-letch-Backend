from datetime import datetime

from django.contrib.auth.models import User
from django.http import Http404
from django.shortcuts import get_object_or_404

from userProfile.models import UserProfile
from .models import ProjectStarter, Project
from .serializer import ProjectStarterSerializer, ProjectSerializer

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny




class ProjectStarterList(APIView):
    permission_classes = (AllowAny,)

    def post(self, request, format=None):
        serializer = ProjectStarterSerializer(data=request.data)
        if serializer.is_valid():

            dic = {
                    "author" : request.data["author"],
                    "zone" : request.data["zone"],
                    "product" : request.data["product"],
                    "surface" : request.data["surface"],
                    "treeNursery" : False,
                    "treeNumberByHectare" : 100,
                    "semDensity" : 2,
                    "fertilizerProportion" : 100,
                    "phytoThreatment" : 50,
                    "productPrice" : 500,
                    "semDate" : str(datetime.now()),
                    "cropDate" : str(datetime.now()),
                    "cropTotalProduct" : 500,
                    "created_at" : str(datetime.now()),
                    "update_at" : str(datetime.now()),
            }

            pserializer = ProjectSerializer(data=dic)

            if pserializer.is_valid():
                serializer.save()
                pserializer.save()

                return Response(pserializer.data, status=status.HTTP_201_CREATED)
            return Response(pserializer.errors, status=status.HTTP_400_BAD_REQUEST)


class ProjectStarterDetail(APIView):
    permission_classes = (AllowAny,)

    def get_object(self, username):
        name = str(username)
        try:
            return User.objects.get(username=name)
        except User.DoesNotExist:
            raise  Http404

    def get(self, request, username, format=None):
        user = self.get_object(username)
        profile = get_object_or_404(UserProfile, user_id=user.id)
        result = get_object_or_404(ProjectStarter, author_id=profile.id)
        serializer = ProjectStarterSerializer(result)
        return Response(serializer.data)


class ProjectDetail(APIView):
    permission_classes = (AllowAny,)

    def get_object(self, username):
        name = str(username)
        try:
            return User.objects.get(username=name)
        except User.DoesNotExist:
            raise  Http404

    def get(self, request, username, format=None):
        user = self.get_object(username)
        profile = get_object_or_404(UserProfile, user_id=user.id)
        result = get_object_or_404(Project, author_id=profile.id)
        serializer = ProjectSerializer(result)
        return Response(serializer.data)
