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
	age = models.IntegerField()
	phone = models.CharField(max_length=9)
	profession = models.CharField(max_length=50)
	country = models.CharField(max_length=50)
	city = models.CharField(max_length=50)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now_add=True)
	avatar = models.ImageField(upload_to=user_image, verbose_name='UserImage', blank=True)

	class Meta:
		ordering = ['-id']
		verbose_name_plural = 'UserProfiles'

	def __str__(self):
		return self.user.first_name + ' ' + self.user.last_name

