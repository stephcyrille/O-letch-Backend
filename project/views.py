from .models import ProjectStarter, Project
from userProfile.models import UserProfile 
from django.http import Http404
from django.shortcuts import get_object_or_404

from .serializer import ProjectStarterSerializer, ProfileSerializer

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status




class ProjectStarterDetail(APIView):
    def get_object(self, pk):
        try:
            return ProjectStarter.objects.get(pk=pk)
        except ProjectStarter.DoesNotExist:
            raise  Http404

    def get(self, request, pk, format=None):
        project = self.get_object(pk)
        result = get_object_or_404(project, pk=pk)
        serializer = ProjectStarterSerializer(result)
        return Response(serializer.data)