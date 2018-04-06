from django.contrib.auth.models import User
from django.utils.text import slugify
from django.db import models




def user_image(instance, filename):
	username = instance.user.username
	slug = slugify(username)
	basename, file_extension = filename.split(".")
	new_filename = "%s-%s.%s" %(slug, instance.id, file_extension)
	return "avatars/%s/%s" %(slug, new_filename)


class UserProfile(models.Model):
	user = models.ForeignKey(User, null=False)
	age = models.IntegerField(null=True, blank=True)
	phone = models.CharField(max_length=9)
	profession = models.CharField(max_length=50)
	country = models.CharField(max_length=50)
	city = models.CharField(max_length=50)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		ordering = ['-id']
		verbose_name_plural = 'Users Profiles'

	def __str__(self):
		return self.user.username + ', ' + self.city


class UserAvatar(models.Model):
	user = models.ForeignKey(UserProfile, null=False)
	avatar = models.ImageField(upload_to=user_image, verbose_name='avatar', blank=True)

	class Meta:
		ordering = ['-id']
		verbose_name_plural = 'Avatars User'

	def __str__(self):
		return self.user.user.username

