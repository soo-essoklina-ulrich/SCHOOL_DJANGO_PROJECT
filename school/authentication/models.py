from django.db import models
from django.contrib.auth.models import AbstractUser
import random
import string



# Create your models here.


class User(AbstractUser):
    identifiant = models.CharField(max_length=50, blank=True, null=True, unique=True)
    username = models.CharField(max_length=50, blank=True, null=True)
    email = models.EmailField('email address', unique=True)
    native = models.DateField(max_length=20, null=True)
    
    
    numero = models.CharField(max_length=10, null=True)
    is_registered = models.BooleanField(default=False)

    ROLE_STUDENT = 'eleve'
    ROLE_TEACHER = 'enseignant'
    ROLE_ADMIN = 'administrateur'
    ROLE_CHOICES = [
        (ROLE_STUDENT, 'Eleve'),
        (ROLE_TEACHER, 'Enseignant'),
        (ROLE_ADMIN, 'Administrateur'),
    ]
    role = models.CharField(max_length=20, choices=ROLE_CHOICES, null=True)

    USERNAME_FIELD = 'identifiant' #'identifiant'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name', 'email', 'native', 'numero', 'role']
    password = models.CharField(max_length=128, blank=True, null=True)
    
    def generate_random_password(self):
        """
        Génère un mot de passe aléatoire et le définit comme le mot de passe de l'utilisateur.
        """
        random_password = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
        self.set_password(random_password)
        self.save()  # Sauvegarde l'utilisateur pour mettre à jour le mot de passe dans la base de données

    
    def save(self, *args, **kwargs):
        if not self.identifiant:
            identifier = (
                self.first_name[:3] +
                self.last_name[:3] +
                (self.numero[:3] if self.numero else "000")
            )
            self.identifiant = identifier.lower()

        if not self.password:  # Si le mot de passe n'est pas déjà défini (lors de la création)
            self.generate_random_password()  # Génère un mot de passe aléatoire
            print(self.password)
        super().save(*args, **kwargs)


    def __str__(self):
        return "{}".format(self.email)
    def get_data(self):
        initial_data= {'identifiant' : self.identifiant,
                       'username': self.username,
                       'email' : self.email,
                       'first_name' : self.first_name,
                       'last_name' : self.last_name,
                       'native' : self.native,
                       'numero': self.numero,
                       'role' : self.role
                       }
        return initial_data
    
    def get_role(self):
        return self.role