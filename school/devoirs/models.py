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



class Classes(models.Model):
    id = models.AutoField(primary_key=True, unique=True, auto_created=True)
    classe_name = models.CharField(max_length=100)
    
    
    #relation entre les classes les eleves
    eleves = models.ForeignKey(User, on_delete=models.CASCADE, related_name='classes', null=True)
    enseignant = models.ForeignKey(User, on_delete=models.CASCADE, related_name='classes_assigned', null=True)
    
        
    def __str__(self):
        return self.classe_name




class ProjectModule(models.Model):
    STATUS_CHOICES = [
        ('in_progress', 'En cours'),
        ('submitted', 'Soumis'),
        ('evaluated', 'Évalué'),
        # Ajoutez d'autres statuts selon vos besoins
    ]

    title = models.CharField(max_length=100)
    subject = models.CharField(max_length=100)
    file = models.FileField(upload_to='projects/' , null=True)
    status = models.CharField(max_length=40, choices=STATUS_CHOICES, default='in_progress')
    
    created_at = models.DateTimeField(auto_now_add=True)
    period_date = models.TimeField()
    period_time = models.TimeField(null=True)
    end_at = models.DateTimeField()

    Enseignant = models.ForeignKey(User, on_delete=models.CASCADE, related_name='projects_assigned', null=True)
    assigned_to = models.ForeignKey(Classes, on_delete=models.CASCADE, related_name='projects', null=True)
    matiere = models.ForeignKey(Matiere, on_delete=models.CASCADE, related_name='projects', null=True)
    
class Enseignant(models.Model):
    id = models.AutoField(primary_key=True, unique=True, auto_created=True)
    enseignant = models.ForeignKey(User, on_delete=models.CASCADE, related_name='enseignant', null=True)
    
    def __str__(self):
        return self.enseignant.username
    
class Student(models.Model):
    id = models.AutoField(primary_key=True, unique=True, auto_created=True)
    eleve = models.ForeignKey(User, on_delete=models.CASCADE, related_name='eleve', null=True)
    
    def __str__(self):
        return self.eleve.username