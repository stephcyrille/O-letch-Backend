from django.db import models
from userProfile.models import UserProfile



class Question(models.Model):
	author = models.ForeignKey(UserProfile)
	title = models.CharField(max_length=50)
	vote = models.IntegerField(default=0)
	content = models.TextField()
	toggle = models.BooleanField(default=True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		ordering = ['-id']
		verbose_name_plural = 'Questions'

	def __str__(self):
		return self.title

