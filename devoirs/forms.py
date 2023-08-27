from django import forms
from .models import ProjectModule, Submit_file, Matiere
from authentication.models import User



class ProjectForm(forms.ModelForm):
    class Meta:
        model = ProjectModule
        fields = ['title', 'subject', 'project_file', 'end_at', 'assigned_to_eleve', 'matiere']
        exclude = ['status', 'created_at' , 'submitted']
        
          
    title = forms.CharField(
        max_length=100,
        
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project Title'
            }    
        )
    )
    subject = forms.CharField(
        
        widget=forms.Textarea(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project details'
            }
        )
    )
    
    project_file = forms.FileField(
        widget=forms.FileInput(
            attrs={
                'class': 'form-control',
                'type': 'file',
                'id' : 'inputGroupFile01'
            }
        )
    )
    
    end_at = forms.DateTimeField(
        
        widget=forms.DateTimeInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project Period end date',
                'type': 'date'
            }
        )
    )
    
    assigned_to_eleve = forms.ModelChoiceField(
        queryset=User.objects.filter(role='eleve'),
        widget=forms.Select(
            attrs={
                'class': 'form-control',
            }
        )
    )
    matiere = forms.ModelChoiceField(
        queryset=Matiere.objects.all(),
        widget=forms.Select(
            attrs={
                'class': 'form-control', 
            }
        )
    )
    
    
    
        
        
        
class ProjectUpdateForm(forms.ModelForm):
    class Meta:
        model = ProjectModule
        fields = ['title', 'subject', 'project_file', 'end_at', 'assigned_to_eleve', 'matiere']
        exclude = ['status', 'created_at' , 'submitted']
        
          
    title = forms.CharField(
        max_length=100,
        
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project Title'
            }    
        )
    )
    subject = forms.CharField(
        
        widget=forms.Textarea(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project details'
            }
        )
    )
    
    project_file = forms.FileField(
        widget=forms.FileInput(
            attrs={
                'class': 'form-control',
                'type': 'file',
                'id' : 'inputGroupFile01'
            }
        )
    )
    
    end_at = forms.DateTimeField(
        
        widget=forms.DateTimeInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project Period end date',
                'type': 'date'
            }
        )
    )
    
    assigned_to_eleve = forms.ModelChoiceField(
        queryset=User.objects.filter(role='eleve'),
        widget=forms.Select(
            attrs={
                'class': 'form-control',
            }
        )
    )
    matiere = forms.ModelChoiceField(
        queryset=Matiere.objects.all(),
        widget=forms.Select(
            attrs={
                'class': 'form-control', 
            }
        )
    )
        
    
class SubmitForm(forms.ModelForm):
    submit_file = forms.FileField(
        
        widget=forms.FileInput(
            attrs={
                'class': 'form-control',
                'id': 'autoSizingInputGroup',
                'type': 'file'
                
            }
        )
    )
    
    class Meta:
        model = Submit_file
        fields = '__all__'
        exclude = ['submitted_at', 'submitted_by', 'project']   
