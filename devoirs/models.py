from django.db import models
from django.contrib.auth import get_user_model
import os

# Create your models here.

User = get_user_model()

#genereate path for each file uploaded by teacher or admin
def file_path_project(instance, filename):
    # Obtenez le nom d'utilisateur de l'utilisateur actuel
    username = instance.Enseignant.username if instance.Enseignant else 'default'
    # Générez le chemin de fichier pour le fichier téléchargé
    path = 'documents/uploads/'+ str(username)
    format = 'uploads' + instance.title + filename
    return os.path.join(path, format)
#genereate path for each file submitted by student
def file_path_sbmt(instance, filename):
    user = instance.submitted_by.username if instance.submitted_by else 'default'
    path = 'documents/submitted/' + str(user)
    format = str(user)+ instance.project.title + filename
    return os.path.join(path, format)

class Matiere(models.Model):
    id = models.AutoField(primary_key=True, unique=True, auto_created=True)
    matiere_name = models.CharField(max_length=100)
    enseignant = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='matieres_assigned', null=True)
    
    def __str__(self):
        return self.matiere_name
    
class Submit_file(models.Model):
    submit_file = models.FileField(upload_to=file_path_sbmt , null=True)
    submitted_at = models.DateTimeField(auto_now_add=True)
    submitted_by = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='submitted_by', null=True)
    project = models.ForeignKey('ProjectModule', on_delete=models.SET_NULL, related_name='submitted_project', null=True)
    
    def __str__(self):
        return str(self.submit_file)

class ProjectModule(models.Model):
    STATUS_CHOICES = [
        ('in_progress', 'En cours'),
        ('submitted', 'Soumis'),
        ('evaluated', 'Évalué'),
        # Ajoutez d'autres statuts selon vos besoins
    ]

    title = models.CharField(max_length=100)
    subject = models.TextField()
    project_file = models.FileField(upload_to=file_path_project , null=True)
    status = models.CharField(max_length=40, choices=STATUS_CHOICES, default='in_progress')
    
    created_at = models.DateTimeField(auto_now_add=True)
   
    end_at = models.DateTimeField()

    Enseignant = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='projects_assigned', null=True)
    assigned_to_eleve = models.ForeignKey(User, on_delete=models.SET_NULL, related_name='projects_eleve', null=True)
   
    matiere = models.ForeignKey(Matiere, on_delete=models.CASCADE, related_name='projects_matiere', null=True)
    
    submitted = models.OneToOneField(Submit_file, on_delete=models.SET_NULL, related_name='submitted_project', null=True, blank=True)
    
    
    def __str__(self):
        return f"{self.title } - {self.project_file}" 

    