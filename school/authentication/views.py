from django.shortcuts import render , redirect, resolve_url
from django.contrib.auth import authenticate, login, logout # type: ignore
from .forms import LoginForm, RegisterForm, UpdateInfoForm
from .models import User

# Create your views here.
login_url = resolve_url('login') 
home_url = resolve_url('index')
profile_url = resolve_url('profil')
msg = None



def login_user(request):
    form = LoginForm(request.POST or None)
    userr= User
    
    
    
    if request.method == "POST":
        if form.is_valid():
            identifiant = form.cleaned_data.get("identifiant")
            password = form.cleaned_data.get("password")

            user = authenticate(request, identifiant=identifiant, password=password)

            if user is not None and userr.is_registered: 
                login(request, user)
                
                return redirect(home_url)
            elif user is None:
                msg = 'Invalid credentials'
            else:    
                msg = 'User in not registered'    
        else:
            msg = 'Error validating the form'
    return render(request, "authentication/login.html", {"form": form, "msg" : msg})


def logout_user(request):
    logout(request)
   
    return redirect(login_url)

def register(request):
    
    success = False
    
    if request.method == "POST":
        form = RegisterForm(request.POST)
        
        if form.is_valid():
            user = User()
            user= form.save(commit=False)
            user.set_unusable_password()
            print(user.password)
            user.save()
            
            
            msg = 'User created.'
            success = True
        else:
            print(form.errors)
            msg = 'Form is not valid'
    else:
        form = RegisterForm()
    return render(request, "authentication/register.html", {"form": form, "msg" : msg, "success" : success})




def profil(request):
    
    if request.method == "POST":
        form = UpdateInfoForm(request.POST)
        if form.is_valid():
            form.save()
            
            return redirect(profile_url)
        else:
            msg = "Erreur lors de la modification des informations"
            print(form.errors)
    else:
        initial_data1 = {'identifiant' : request.user.identifiant, 'email' : request.user.email, 'first_name' : request.user.first_name, 'last_name' : request.user.last_name}
        initial_data={}
        form = UpdateInfoForm(initial=initial_data)
    
    #context = {'form' : form}
    return render(request, "authentication/profil.html", {})