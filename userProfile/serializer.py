from django.contrib.auth.models import User
from rest_framework import serializers

from userProfile.models import UserProfile




class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email')

class ProfileSerializer(serializers.ModelSerializer):
	user = UserSerializer(required=True)

	class Meta:
		model = UserProfile
		fields = ('user', 'age', 'profession', 'phone', 'country', 'city', 'avatar', 'created_at', 'update_at')

	def create(self, validated_data):
		"""
		Overriding the default create method of the model User serializer
		:param validated_data: data containing all the details of product
		:return: return a successfully created product record
		"""
		user_data = validated_data.pop('user')
		user = UserSerializer.create(UserSerializer(), validated_data=user_data)
		profile, created = UserProfile.objects.update_or_create(user=user, age=validated_data.pop('age'), profession=validated_data.pop('profession'), phone=validated_data.pop('phone'), country=validated_data.pop('country'), city=validated_data.pop('city'), avatar=validated_data.pop('avatar'), created_at=validated_data.pop('created_at'), update_at=validated_data.pop('update_at'))
		return profile