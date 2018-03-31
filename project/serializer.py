from django.contrib.auth.models import User
from rest_framework import serializers

from userProfile.models import UserProfile
from .models import ProjectStarter, Project



class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')


class ProfileSerializer(serializers.ModelSerializer):
	user = UserSerializer(required=True)

	class Meta:
		model = UserProfile
		fields = ('user', 'age', 'profession', 'phone', 'country', 'city', 'avatar')


class ProjectStarterSerializer(serializers.ModelSerializer):
	author = ProfileSerializer(required=True)

	class Meta:
		model = ProjectStarter
		fields = ('author', 'zone', 'product', 'surface', 'basic', 'advanced', 'professional')

	def create(self, validated_data):
		"""
		Overriding the default create method of the model Profile serializer
		:param validated_data: data containing all the details of author
		:return: return a successfully created author record
		"""
		author_data = validated_data.pop('author')
		author = ProfileSerializer.create(ProfileSerializer(), validated_data=author_data)
		projectStarter, created = ProjectStarter.objects.update_or_create(author=author, basic=validated_data.pop('basic'), advanced=validated_data.pop('advanced'), professional=validated_data.pop('professional'), zone=validated_data.pop('zone'), product=validated_data.pop('product'), surface=validated_data.pop('surface'))
		return projectStarter