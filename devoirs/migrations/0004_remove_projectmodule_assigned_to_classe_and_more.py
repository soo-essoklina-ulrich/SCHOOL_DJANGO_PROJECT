# Generated by Django 4.2.4 on 2023-08-20 22:56

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('devoirs', '0003_alter_projectmodule_period_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='projectmodule',
            name='assigned_to_classe',
        ),
        migrations.AddField(
            model_name='projectmodule',
            name='ELeves',
            field=models.OneToOneField(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='projects_eleves', to=settings.AUTH_USER_MODEL),
        ),
    ]
