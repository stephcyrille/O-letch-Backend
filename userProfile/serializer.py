from django.contrib.auth.models import User
from rest_framework import serializers

from userProfile.models import UserProfile, UserAvatar




class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ('id', 'username', 'first_name', 'last_name', 'email', 'password')

    def create(self, validated_data):
        user = super(UserSerializer, self).create(validated_data)
        user.set_password(validated_data["password"])
        user.save()
        return user

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
		user = UserSerializer.create(UserSerializer(), validated_data=user_data)
		profile, created = UserProfile.objects.update_or_create(user=user, age=validated_data.pop('age'), profession=validated_data.pop('profession'), phone=validated_data.pop('phone'), country=validated_data.pop('country'), city=validated_data.pop('city'), created_at=validated_data.pop('created_at'), update_at=validated_data.pop('update_at'))
		return profile


class ProfilePostSerializer(serializers.ModelSerializer):

	class Meta:
		model = UserProfile
		fields = ('id', 'user', 'age', 'profession', 'phone', 'country', 'city', 'created_at', 'update_at')


class UserAvatarSerializer(serializers.ModelSerializer):

	class Meta:
		model = UserAvatar
		fields = ('id', 'user', 'avatar')
