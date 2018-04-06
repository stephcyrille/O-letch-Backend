from django.db import models



ZONE_CHOICE = (
    ('AUCUNE', 'Aucune'),
    ('Z1', 'Nord et Extrême Nord'),
    ('Z2', 'Adamaoua, département du mbam'),
    ('Z3', 'Ouest et Nord-Ouest'),
    ('Z4', 'Littoral et Sud-Ouest'),
    ('Z5', 'Centre, Sud, Est'),
    ('INTERNATIONAL', 'International'),
)



class Article(models.Model):
    zone = models.CharField(max_length=20, default="AUCUNE", choices=ZONE_CHOICE)
    title = models.CharField(max_length=100)
    content = models.TextField()
    is_active = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    update_at = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(upload_to='news/', verbose_name='Image', blank=True)

    class Meta:
        ordering = ['-id']
        verbose_name_plural = 'Articles'

    def __str__(self):
        return self.zone



