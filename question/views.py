from .models import Question, Answer
from userProfile.models import UserProfile 
from django.http import Http404
from django.shortcuts import get_object_or_404

from .serializer import QuestionSerializer, AnswerSerializer, ProfileSerializer

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


class AnswerList(APIView):
    """ 
        Creation of the class in wich we would perform
        all the API actions (GET, POST, DELETE)
    """    
    def get_object(self, pk):
        try:
            return Question.objects.get(pk=pk)
        except Question.DoesNotExist:
            raise  Http404

    def get(self, request, pk, format=None):
        question = self.get_object(pk)
        answers = Answer.objects.filter(question=question.pk)
        serializer = AnswerSerializer(answers, many=True)
        return Response(serializer.data)
    
    """def post(self, request, format=None):
        serializer = QuestionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        question = self.get_object(pk)
        question.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    """

 
class AnswerDetail(APIView):
    def get_u_object(self, pk_u):
        try:
            return UserProfile.objects.get(pk=pk_u)
        except UserProfile.DoesNotExist:
            raise  Http404

    def get_q_object(self, pk):
        try:
            return Question.objects.get(pk=pk)
        except Question.DoesNotExist:
            raise  Http404


    def get(self, request, pk_answer, pk_user, pk_question, format=None):
        user = self.get_u_object(pk_user)
        question = self.get_q_object(pk_question)
        answer = Answer.objects.filter(author_id=user.id, question_id=question.id)
        result = get_object_or_404(answer, pk=pk_answer)
        serializer = AnswerSerializer(result)
        return Response(serializer.data)