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

	class Meta:
		model = ProjectStarter
		fields = ('author', 'zone', 'product', 'surface', 'update_at', 'created_at')


class ProjectSerializer(serializers.ModelSerializer):

    class Meta:
        model = Project
        fields = ('author', 'projectType', 'zone', 'product', 'surface', 'treeNursery', 'treeNumberByHectare', 'semDensity', 'fertilizerProportion', 'phytoThreatment', 'productPrice', 'semDate', 'cropDate', 'cropTotalProduct', 'active', 'update_at', 'created_at')




# basic=validated_data.pop('basic'), advanced=validated_data.pop('advanced'), professional=validated_data.pop('professional'),
# , 'basic', 'advanced', 'professional'