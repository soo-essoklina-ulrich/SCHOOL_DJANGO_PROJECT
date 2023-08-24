from django import forms
from .models import ProjectModule, Submit_file

class ProjectForm(forms.ModelForm):
    title = forms.CharField(
        max_length=100,
        label='Project Title',
        widget=forms.TextInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project Title'
            }    
        )
    )
    subject = forms.CharField(
        label='Subject',
        widget=forms.Textarea(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project details'
            }
        )
    )
    
    file = forms.FileField(
        label='Upload File',
        widget=forms.FileInput(
            attrs={
                'class': 'form-control'
            }
        )
    )
    
    period_date = forms.DateTimeField(
        label='date',
        widget=forms.DateTimeInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project Period end date',
                'type': 'date'
            }
        )
    )
    
    period_time = forms.DateTimeField(
        label='time',
        widget=forms.DateTimeInput(
            attrs={
                'class': 'form-control',
                'placeholder': 'Enter Project Period end time',
                'type': 'time'
            }
        )
    )
    
    class Meta:
        model = ProjectModule
        fields = '__all__'
        exclude = ['status', 'created_at']
        
        
        
class ProjectUpdateForm(forms.ModelForm):
    class Meta:
        model = ProjectModule
        fields = '__all__'
        
    
class SubmitForm(forms.ModelForm):
    submit_file = forms.FileField(
        label='Submit Project',
        widget=forms.FileInput(
            attrs={
                'class': 'form-control'
            }
        )
    )
    
    class Meta:
        model = Submit_file
        fields = '__all__'
        exclude = ['submitted_at', 'submitted_by', 'project']   
