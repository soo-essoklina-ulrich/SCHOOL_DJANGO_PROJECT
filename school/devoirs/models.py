from django.db import models
from django.contrib.auth import get_user_model

# Create your models here.

User = get_user_model()

class Matiere(models.Model):
    id = models.AutoField(primary_key=True, unique=True, auto_created=True)
    matiere_name = models.CharField(max_length=100)
    enseignant = models.ForeignKey(User, on_delete=models.CASCADE, related_name='matieres_assigned', null=True)
    
    def __str__(self):
        return self.matiere_name

class ProjectModule(models.Model):
    STATUS_CHOICES = [
        ('in_progress', 'En cours'),
        ('submitted', 'Soumis'),
        ('evaluated', 'Évalué'),
        # Ajoutez d'autres statuts selon vos besoins
    ]

    title = models.CharField(max_length=100)
    subject = models.TextField()
    file = models.FileField(upload_to='projects/' , null=True)
    status = models.CharField(max_length=40, choices=STATUS_CHOICES, default='in_progress')
    
    created_at = models.DateTimeField(auto_now_add=True)
   
    end_at = models.DateTimeField()

    Enseignant = models.ForeignKey(User, on_delete=models.CASCADE, related_name='projects_assigned', null=True)
    assigned_to_eleve = models.ForeignKey(User, on_delete=models.CASCADE, related_name='projects_eleve', null=True)
   
    matiere = models.ForeignKey(Matiere, on_delete=models.CASCADE, related_name='projects_matiere', null=True)
    
    is_submitted = models.BooleanField(default=False)