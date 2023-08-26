from django.urls import path
from .views import *

urlpatterns = [
    path('', index, name='index'),
    path('list_student/', project_list_for_student, name='list-student'),
    path('list_teacher/', project_list_for_teacher, name='list-teacher'),
    path('list_admin/', all_list_for_admin, name='list-admin'),
    #path('list_admin/', project_list_for_admin, name='list-admin'),
    path('create/', create_project, name='create'),
    path('update/<int:id>/', update_project, name='update'),
    path('delete/<int:id>/', delete_project, name='delete'),
    path('detail_tch/<int:id>/', project_detail_for_teacher, name='detail-teacher'),
    path('detail_std/<int:id>/', project_detail_for_student, name='detail-std'),
    #path('sbmt/<int:id>/', submit_project_by_student, name='submit'),
]
