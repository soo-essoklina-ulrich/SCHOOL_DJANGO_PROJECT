# Generated by Django 4.2.4 on 2023-08-26 12:59

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('devoirs', '0010_rename_enseignant_projectmodule_enseignant'),
    ]

    operations = [
        migrations.RenameField(
            model_name='projectmodule',
            old_name='enseignant',
            new_name='Enseignant',
        ),
    ]
