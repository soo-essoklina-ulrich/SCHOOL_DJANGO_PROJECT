from django.shortcuts import render, redirect, resolve_url
from django.contrib.auth.decorators import login_required
from datetime import datetime
import pytz
from django.conf import settings

from .models import ProjectModule, Submit_file
from .forms import ProjectForm, SubmitForm
# Create your views here.
@login_required(login_url='auth/login/')
def project_list_for_student(request):
    user = request.user
    projects = ProjectModule.objects.filter(assigned_to_eleve = user)
    return render(request, 'devoirs/student/projects_list_student.html', {'projects': projects})

@login_required(login_url='auth/login/')
def project_list_for_teacher(request):
    projects = ProjectModule.objects.all()
    return render(request, 'devoirs/enseignant/projects_list_teacher.html', {'projects': projects})

@login_required(login_url='auth/login/')
def project_detail_for_teacher(request, id):
    project = ProjectModule.objects.get(pk=id)
    return render(request, 'devoirs/enseignant/project_detail.html', {'project': project})

@login_required(login_url='auth/login/')
def project_detail_for_student(request, id):
    msg = None
    project = ProjectModule.objects.get(pk=id)
    #file_sbmt = Submit_file.objects.filter(project=project, submitted_by=request.user)
    file = Submit_file.objects.get(project=project, submitted_by=request.user)
    
    
    
    current_time = datetime.now(pytz.timezone(settings.TIME_ZONE))
    time_dif = current_time - project.end_at.replace(tzinfo=pytz.timezone(settings.TIME_ZONE))
    hours, remainder = divmod(time_dif.seconds, 3600)
    minutes, seconds = divmod(remainder, 60)
    
    if request.method == 'POST':
        form = SubmitForm(request.POST, request.FILES or None)
        if form.is_valid():
            #Submit_file = form.save(commit=False)
            Submit_file.objects.get_or_create(submit_file=request.FILES['submit_file'], submitted_by=request.user, project=project)
            msg = 'Projet soumis avec succès'
            
        else:
            msg = 'Erreur lors de la soumission du projet'
            
    else:
        form = SubmitForm()
    context = {'project': project,'file_sbmt' : file, 'form': form, 'msg': msg, 'time_dif': time_dif,'hours': hours,'minutes': minutes,'seconds': seconds}
    return render(request, 'devoirs/student/project_detail.html', context)

@login_required(login_url='auth/login/')
def create_project(request):
    msg = None
    success = False
    if request.method == 'POST':
        form = ProjectForm(request.POST, request.FILES or None)
        if form.is_valid():
            form.save()
            msg = 'Projet ajouté avec succès'
            return redirect('list-teacher')
        else:
            msg = 'Erreur lors de la création du projet'
    else:
        form = ProjectForm()
    return render(request, 'devoirs/project/create_project.html', {'form': form, 'msg': msg, "success" : success})

# @login_required(login_url='auth/login/')
# def submit_project_by_student(request, id):
#     template_name = 'devoirs/student/submit_project.html'
    

   

@login_required(login_url='auth/login/')
def delete_project(request, id):
    project = ProjectModule.objects.get(pk=id)
    project.delete()
    return redirect('project-list')

@login_required(login_url='auth/login/')
def update_project(request, id):
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
    return render(request, 'devoirs/enseignant/update_project.html', {'project_form': project_form, 'msg': msg})

    #return render(request, 'devoirs/update_project.html', {'project': project})
    
    
    
    
    
@login_required(login_url='auth/login/')  
def index(request):
    role = request.user.role
    context = {'role': role}
    return render(request, 'devoirs/index.html', context)
