from django.contrib import admin
from .models import *

# Register your models here.

admin.site.register(ProjectModule)
admin.site.register(Matiere)
admin.site.register(Classes)
admin.site.register(Enseignant)
admin.site.register(Student)