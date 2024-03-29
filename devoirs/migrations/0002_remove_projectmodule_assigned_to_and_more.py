# Generated by Django 4.2.4 on 2023-08-20 10:56

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('devoirs', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='projectmodule',
            name='assigned_to',
        ),
        migrations.AddField(
            model_name='projectmodule',
            name='assigned_to_classe',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='projects_classe', to='devoirs.classes'),
        ),
        migrations.AddField(
            model_name='projectmodule',
            name='assigned_to_eleve',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='projects_eleve', to=settings.AUTH_USER_MODEL),
        ),
        migrations.AlterField(
            model_name='projectmodule',
            name='matiere',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='projects_matiere', to='devoirs.matiere'),
        ),
    ]
