from .models import UserProfile
from django.http import Http404
from django.shortcuts import get_object_or_404

from .serializer import ProfileSerializer

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status



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
	def get_object(self, pk):
		try:
			return UserProfile.objects.get(pk=pk)
		except UserProfile.DoesNotExist:
			raise  Http404


	def get(self, request, pk, pk_p, format=None):
		user = self.get_object(pk)
		profile = UserProfile.objects.filter(user_id=user.pk)
		result = get_object_or_404(profile, pk=pk_p)
		serializer = ProfileSerializer(result)
		return Response(serializer.data)