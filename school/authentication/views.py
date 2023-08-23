from django.shortcuts import render , redirect, resolve_url
from django.contrib.auth import authenticate, login, logout, get_user_model
from .forms import LoginForm, RegisterForm, UpdateInfoForm
from .models import User

# Create your views here.







def login_user(request):
    form = LoginForm(request.POST or None)
    
    msg = None
    
    
    if request.method == "POST":
        if form.is_valid():
            identifiant = form.cleaned_data.get("identifiant")
            password = form.cleaned_data.get("password")

            user = authenticate(identifiant=identifiant, password=password)

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
        userr = User
        initial_data= {'identifiant' : request.user.identifiant,
                       'username': request.user.username ,
                       'email' : request.user.email,
                       'first_name' : request.user.first_name,
                       'last_name' : request.user.last_name,
                       'native' : request.user.native,
                       'numero': request.user.numero,
                       'role' : request.user.role
                       }
        print (initial_data)
        print(userr.get_data(self=request.user))
        print (userr.get_role(self=request.user))
        
        
        form = UpdateInfoForm(initial=initial_data)
    
    context = {'form' : form, 'msg' : msg}
    return render(request, "authentication/profil.html", context)