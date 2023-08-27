from django.shortcuts import render , redirect, resolve_url
from django.contrib.auth import authenticate, login, logout
from django.core.mail import send_mail, EmailMessage
from django.conf import settings
import string
import random
import smtplib
from .forms import LoginForm, RegisterForm, UpdateInfoForm


# Create your views here.







def login_user(request):
    form = LoginForm(request.POST or None)
    
    msg = None
    
    
    if request.method == "POST":
        if form.is_valid():
            identifiant = form.cleaned_data.get("identifiant")
            password = form.cleaned_data.get("password")

            user = authenticate(identifiant=identifiant, password=password)
            print(user)

            if user is not None: 
                login(request, user)
                home_url = resolve_url('index')
                return redirect(home_url)
            else:    
                msg = 'User in not registered'    
        else:
            print (form.errors)
            msg = 'Error validating the form'
    return render(request, "authentication/login.html", {"form": form, "msg" : msg})


def logout_user(request):
    logout(request)
    login_url = resolve_url('login') 
    return redirect(login_url)

def register(request):
    msg = None
    msg_mail = None
    success = False
    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(random.choice(characters) for _ in range(8))
    print(password)
    
    if request.method == "POST":
        form = RegisterForm(request.POST)
        
        if form.is_valid():
            form.initial['password1'] = password
            form.initial['password2'] = password
            user= form.save(commit=False)

            
            #recuperer les données du formulaire
            mail = form.cleaned_data.get("email")
            identifiant = form.cleaned_data.get("identifiant")
            user.save()
            
            try:
                #se connecter au serveur smtp
                connection = smtplib.SMTP(settings.EMAIL_HOST, settings.EMAIL_PORT)
                connection.starttls()
                connection.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
            
                #envoyer le mail
                email = EmailMessage(
                    subject="Bienvenue sur la plateforme devoirs",
                    message="Bonjour, \n\nNous vous souhaitons la bienvenue sur la plateforme devoirs. \n\nCordialement, \n\nL'équipe devoirs",
                    body = "votre ID est : "+identifiant+" et votre mot de passe est : "+password+"",
                    from_email="admin@school.projet",
                    to=[mail],
                )
                email.send()
                connection.quit()
            except Exception as e:
                print(f"Erreur lors de l'envoi du mail à {e}")
                msg_mail = "Erreur lors de l'envoi du mail"
            
            
            msg = 'User created.'
            success = True
        else:
            print(form.errors)
            msg = 'Form is not valid'
    else:
        form = RegisterForm()
    return render(request, "authentication/register.html", {"form": form, "msg" : msg, "success" : success, "msg_mail" : msg_mail})




def profil(request):
    msg = None
    if request.method == "POST":
        form = UpdateInfoForm(request.POST)
        if form.is_valid():
            form.save()
            profile_url = resolve_url('profil')
            return redirect(profile_url)
        else:
            msg = "Erreur lors de la modification des informations"
            print(form.errors)
    else:
        
        initial_data= {'identifiant' : request.user.identifiant,
                       'username': request.user.username ,
                       'email' : request.user.email,
                       'first_name' : request.user.first_name,
                       'last_name' : request.user.last_name,
                       'native' : request.user.native,
                       'numero': request.user.numero,
                       'role' : request.user.role
                       } 
        form = UpdateInfoForm(initial=initial_data)
    
    context = {'form' : form, 'msg' : msg}
    return render(request, "authentication/profil.html", context)