from django.contrib.auth.models import User
from django.contrib.auth.validators import UnicodeUsernameValidator

from rest_framework import serializers

from userProfile.models import UserProfile
from .models import Question, Answer



class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')
        extra_kwargs = {
            'username': {
                'validators': [UnicodeUsernameValidator()],
            }
        }


class ProfileSerializer(serializers.ModelSerializer):
    user = UserSerializer(required=True)

    class Meta:
        model = UserProfile
        fields = ('id', 'user', 'age', 'profession', 'phone', 'country', 'city', 'created_at', 'update_at')

    def create(self, validated_data):
        """
        Overriding the default create method of the model User serializer
        :param validated_data: data containing all the details of product
        :return: return a successfully created product record
        """
        user_data = validated_data.pop('user')
        username = user_data.pop("username")
        user = User.objects.get_or_create(username=username)[0]
        profile = UserProfile.objects.create(user=user, **validated_data)
        return profile

    def update(self, instance, validated_data):
        user_data = validated_data.pop('user')
        username = user_data.pop("username")
        user = User.objects.get_or_create(username=username)[0]
        instance.user = user
        instance.age = validated_data['age']
        instance.profession = validated_data['profession']
        instance.phone = validated_data['phone']
        instance.country = validated_data['country']
        instance.city = validated_data['city']
        instance.created_at = validated_data['created_at']
        instance.update_at = validated_data['update_at']
        return instance


class QuestionSerializer(serializers.ModelSerializer):
	author = ProfileSerializer(required=True)

	class Meta:
		model = Question
		fields = ('id', 'title', 'content', 'vote', 'toggle', 'created_at', 'update_at', 'author')

	def create(self, validated_data):
		"""
		Overriding the default create method of the model User serializer
		:param validated_data: data containing all the details of product
		:return: return a successfully created product record
		"""
		author_data = validated_data.pop('author')
		author = ProfileSerializer.create(ProfileSerializer(), validated_data=author_data)
		question, created = Question.objects.update_or_create(author=author, title=validated_data.pop('title'), content=validated_data.pop('content'), vote=validated_data.pop('vote'), toggle=validated_data.pop('toggle'), created_at=validated_data.pop('created_at'), update_at=validated_data.pop('update_at'))
		return question


class QuestionPostSerializer(serializers.ModelSerializer):
	class Meta:
		model = Question
		fields = ('id', 'title', 'content', 'vote', 'toggle', 'created_at', 'update_at', 'author')


class AnswerSerializer(serializers.ModelSerializer):
	author = ProfileSerializer(required=True)

	class Meta:
		model = Answer
		fields = ('id', 'content', 'vote', 'author', 'created_at')

	def create(self, validated_data):
		"""
		Overriding the default create method of the model Answer serializer
		:param validated_data: data containing all the details of things
		:return: return a successfully created things record
		"""
		author_data = validated_data.pop('author')
		author = ProfileSerializer.create(ProfileSerializer(), validated_data=author_data)
		answer, created = Answer.objects.update_or_create(author=author, id=validated_data.pop('id'), content=validated_data.pop('content'), vote=validated_data.pop('vote'), created_at=validated_data.pop('created_at'))
		return answer


class AnswerPostSerializer(serializers.ModelSerializer):
	class Meta:
		model = Answer
		fields = ('id', 'author', 'question', 'content', 'vote', 'created_at')