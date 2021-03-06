from django.db import models
from userProfile.models import UserProfile



class ProjectStarter(models.Model):
	author = models.ForeignKey(UserProfile)
	#basic = models.BooleanField(default=False)
	#avdanced = models.BooleanField(default=False)
	#professional = models.BooleanField(default=False)
	zone = models.CharField(max_length=200)
	product = models.CharField(max_length=50)
	surface = models.IntegerField(default=0)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		ordering = ['-id']
		verbose_name_plural = 'Projects Starters'

	def __str__(self):
		return self.author.user.first_name + ' ' + self.author.user.last_name + ' ' + self.zone

class Project(models.Model):
	author = models.ForeignKey(UserProfile)
	projectType = models.CharField(max_length=50, default="basic")				# Typt de projet: basic, avance ou pro
	zone = models.CharField(max_length=50)
	product = models.CharField(max_length=50)
	surface = models.IntegerField(default=0)
	treeNursery = models.BooleanField(default=False) 			# Y'aura t-il une pepiniere?
	treeNumberByHectare = models.IntegerField(default=0) 		# Nombre de plan par hectare
	semDensity = models.IntegerField(default=0) 				# Densite de semi
	fertilizerProportion = models.IntegerField(default=0) 		# Proportion d'engrais recommandee
	phytoThreatment = models.IntegerField(default=0) 			# Proportion de traitement phyto
	productPrice = models.IntegerField(default=0) 				# Proposition des prix des intrants
	semDate = models.DateTimeField() 							# Date de semi
	cropDate = models.DateTimeField() 							# Date de recolte
	cropTotalProduct = models.IntegerField(default=0) 			# Prix estimatif des produit
	active = models.BooleanField(default=False)
	created_at = models.DateTimeField(auto_now_add=True)
	update_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		ordering = ['-id']
		verbose_name_plural = 'Projects'

	def __str__(self):
		return self.author.user.first_name + ' ' + self.author.user.last_name