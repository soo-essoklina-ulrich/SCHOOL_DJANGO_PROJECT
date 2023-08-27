from django.shortcuts import render, redirect, resolve_url
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from datetime import datetime
import pytz
from django.conf import settings

from .models import ProjectModule, Submit_file
from .forms import ProjectForm, SubmitForm, ProjectUpdateForm
# Create your views here.
@login_required(login_url='auth/login/')
def project_list_for_student(request):
    user = request.user
    role = user.role
    projects = ProjectModule.objects.filter(assigned_to_eleve = user)
    context = {'projects': projects, 'role': role}
    return render(request, 'devoirs/student/projects_list_student.html', context)

@login_required(login_url='auth/login/')
def project_list_for_teacher(request):
    role = request.user.role
    projects = ProjectModule.objects.filter(Enseignant = request.user)
    context = {'projects': projects, 'role': role}
    return render(request, 'devoirs/enseignant/projects_list_teacher.html', context)

@login_required(login_url='auth/login/')
def all_list_for_admin(request):
    role = request.user.role
    projects = ProjectModule.objects.all()
    context = {'projects': projects, 'role': role}
    return render(request, 'devoirs/admin/projects_list_admin.html', context)


@login_required(login_url='auth/login/')
def project_detail_for_student(request, id):
    role = request.user.role
    msg = None
    project = ProjectModule.objects.get(pk=id)
    file = Submit_file.objects.filter(project=project, submitted_by=request.user).first()
    
    if file is not None:
        msg = 'Projet déjà soumis'
    else:
        file = None
        msg = 'Projet non soumis'
    
    
    
    current_time = datetime.now(pytz.timezone(settings.TIME_ZONE))
    time_dif = current_time - project.end_at.replace(tzinfo=pytz.timezone(settings.TIME_ZONE))
    hours, remainder = divmod(time_dif.seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    
    if request.method == 'POST':
        form = SubmitForm(request.POST, request.FILES or None)
        if form.is_valid():
            #
            Submit_file.objects.get_or_create(submit_file=request.FILES['submit_file'], submitted_by=request.user, project=project)
            msg = 'Projet soumis avec succès'
            
        else:
            msg = 'Erreur lors de la soumission du projet'
            
    else:
        form = SubmitForm()
    context = {
        'project': project,
        'file_sbmt' : file if file is not None else None, 
        'form': form, 
        'msg': msg, 
        'time_dif': time_dif,
        'hours': hours,
        'minutes': minutes,
        'seconds': seconds,
        'role': role
        }
    return render(request, 'devoirs/student/project_detail.html', context)

@login_required(login_url='auth/login/')
def create_project(request):
    user = request.user
    msg = None
    success = False
    if request.method == 'POST':
        form = ProjectForm(request.POST, request.FILES or None)
        if form.is_valid():
            project_info = form.save(commit=False)
            project_info.Enseignant = user
            project_info.save()
            msg = 'Projet ajouté avec succès'
            return redirect('list-teacher')
        else:
            msg = 'Erreur lors de la création du projet'
            
    else:
        form = ProjectForm()
    context = {'form': form, 'msg': msg, 'success': success}
    return render(request, 'devoirs/project/create_project.html', context)

@login_required(login_url='auth/login/')
def view_projet(request, id):
    role = request.user.role
    project = ProjectModule.objects.get(pk=id)
    if request.method == 'POST':
        form = ProjectUpdateForm( request.POST, request.FILES or None)
        if form.is_valid():
            update = form.save(commit=False)
            update.save()
            #return redirect('list-student')
        else:
            msg = 'Erreur lors de la soumission du projet'
    else:
        form = ProjectUpdateForm()
    
    context = {'project': project, 'role': role, 'form': form}
    
    return render(request, 'devoirs/project/view_project.html', context)
   

@login_required(login_url='auth/login/')
def delete_project(request, id):
    
    project = ProjectModule.objects.get(pk=id)
    project.delete()
    return redirect('project-list')

@login_required(login_url='auth/login/')
def update_project(request, id):
    role = request.user.role
    project = ProjectModule.objects.get(pk=id)
    msg = None
    if request.method == 'POST':
        project_form = ProjectForm(instance=project, data=request.POST or None, files=request.FILES or None )
        if project_form.is_valid():
            project_form.save()
            return redirect('list-teacher')
        else:
            msg = 'Erreur lors de la modification du projet'
            print(project_form.errors)
    else:
        project_form = ProjectForm(instance=project)
        
    context = {'project_form': project_form, 'msg': msg, 'role': role}
    return render(request, 'devoirs/enseignant/update_project.html', context)
    
    
    
    
    
@login_required(login_url='auth/login/')  
def index(request):
    role = request.user.role
    context = {'role': role}
    return render(request, 'devoirs/index.html', context)
