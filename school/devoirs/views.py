from django.shortcuts import render, redirect
from .models import ProjectModule
from .forms import ProjectForm
# Create your views here.

def project_list_for_student(request):
    projects = ProjectModule.objects.all()
    return render(request, 'devoirs/student/projects_list_student.html', {'projects': projects})

def project_list_for_teacher(request):
    projects = ProjectModule.objects.all()
    return render(request, 'devoirs/enseignant/projects_list_teacher.html', {'projects': projects})

def project_detail_for_teacher(request, project_id):
    project = ProjectModule.objects.get(pk=project_id)
    return render(request, 'devoirs/enseignant/projet_detail.html', {'project': project})

def project_detail_for_student(request, project_id):
    project = ProjectModule.objects.get(pk=project_id)
    return render(request, 'devoirs/student/projet_detail.html', {'project': project})

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

def submit_project_by_student(request, project_id):
    project = ProjectModule.objects.get(pk=project_id)
    
    if request.method == 'POST':
        submitted_file = request.FILES.get('submitted_file')
        project.file = submitted_file
        project.status = 'submitted'
        project.save()
        return redirect('list-student')

    return render(request, 'projects/submit_project.html', {'project': project})

def delete_project(request, project_id):
    project = ProjectModule.objects.get(pk=project_id)
    project.delete()
    return redirect('project-list')

def update_project(request, project_id):
    project = ProjectModule.objects.get(pk=project_id)
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
    
    
    
    
    
    
def index(request):
    return render(request, 'devoirs/index.html')
