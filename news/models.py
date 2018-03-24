from django.db import models
from django.utils.text import slugify



def article_image(instance, filename):
	title = instance.title
	slug = slugify(title)
	basename, file_extension = filename.split(".")
	new_filename = "%s-%s.%s" %(slug, instance.id, file_extension)
	return "articles/%s/%s" %(slug, new_filename)


class Article(models.Model):
	title = models.CharField(max_length=100)
	content = models.TextField()
	is_active = models.BooleanField(default=True)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now_add=True)
	image = models.ImageField(upload_to=article_image, verbose_name='Image', blank=True)

	class Meta:
		ordering = ['-id']
		verbose_name_plural = 'Articles'

	def __str__(self):
		return self.title



