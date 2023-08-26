
from django import forms
from django.contrib.auth.forms import UserCreationForm

from .models import User as CustomUser


class LoginForm(forms.Form):
    identifiant = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "ID",
                "class": "form-control"
            }
        ))
    password = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Password",
                "class": "form-control"
            }
        ))


class RegisterForm(UserCreationForm):
    
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Username",
                "class": "form-control"
            }
        ))
    email = forms.EmailField(
        widget=forms.EmailInput(
            attrs={
                "placeholder": "Email",
                "class": "form-control"
            }
        ))
    first_name = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Nom",
                "class": "form-control"
            }
        ))
    last_name = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Prenom",
                "class": "form-control"
            }
        ))
    native = forms.DateField(
        widget=forms.DateInput(
            attrs={
                "placeholder": "Date de naissance",
                "class": "form-control",
                
                "type": "date"
            }
        ))
    numero = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Numéro de téléphone",
                "class": "form-control"
            }
        ))
    role = forms.CharField(
        widget=forms.Select(
            choices=CustomUser.ROLE_CHOICES,
            attrs={
                "placeholder": "Role",
                "class": "form-control"
            }
        ))
    password1 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Password",
                "class": "form-control"
            }
        ))
    password2 = forms.CharField(
        widget=forms.PasswordInput(
            attrs={
                "placeholder": "Confirm Password",
                "class": "form-control"
            }
        ))
    
    class Meta:
        model = CustomUser
        fields = ('username', 'email', 'first_name', 'last_name', 'native', 'numero', 'role', 'password1', 'password2')
        #exclude = ('password1', 'password2', "password")


class UpdateInfoForm(UserCreationForm):
    
    identifiant = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "ID",
                "class": "form-control",
                "disabled": "disabled",
            }
        ))
    
    username = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Username",
                "class": "form-control"
            }
        ))
    email = forms.EmailField(
        widget=forms.EmailInput(
            attrs={
                "placeholder": "Email",
                "class": "form-control"
            }
        ))
    first_name = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Nom",
                "class": "form-control"
            }
        ))
    last_name = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Prenom",
                "class": "form-control"
            }
        ))
    native = forms.DateField(
        widget=forms.DateInput(
            attrs={
                "placeholder": "Date de naissance",
                "class": "form-control",
                
                "type": "date"
            }
        ))
    numero = forms.CharField(
        widget=forms.TextInput(
            attrs={
                "placeholder": "Numéro de téléphone",
                "class": "form-control"
            }
        ))
    role = forms.CharField(
        widget=forms.Select(
            choices=CustomUser.ROLE_CHOICES,
            attrs={
                "placeholder": "Role",
                "class": "form-control",
                "disabled": "disabled",
            }
        ))
    
    class Meta:
        model = CustomUser
        fields = ('identifiant','username', 'email', 'first_name', 'last_name', 'native', 'numero', 'role' )
    