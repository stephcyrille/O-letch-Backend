from .models import Question
from django.http import Http404
from django.shortcuts import get_object_or_404

from .serializer import QuestionSerializer

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status



class QuestionList(APIView):
    """ 
        Creation of the class in wich we would perform
        all the API actions (GET, POST, DELETE)
    """    
    def get(self, request, format=None):
        questions = Question.objects.all()
        serializer = QuestionSerializer(questions, many=True)
        return Response(serializer.data)
    
    def post(self, request, format=None):
        serializer = QuestionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        question = self.get_object(pk)
        question.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


 