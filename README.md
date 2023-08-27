 # [Django Projet - Gestion de projet étudiant] 

 
<br />


## IPNET EXPERT
### PROJET D’EVALUATION : Développement d’applications avec DJANGO

_2022-2023_

**Système d'allocation et d'évaluation des 
soumissions de projets Projet Python**

#### CONTEXTE :

De nos jours, la gestion de projet étudiant au collège n'est pas une activité facile. 
Pour gérer efficacement l'historique des projets d'étudiants précédents, un 
système bien conçu est nécessaire. Ce projet python de système de soumission de 
projet étudiant a été développé avec Python 3

#### INTRODUCTION :

Les écoles d'ingénieurs mènent des projets ou donnent des missions pour une 
meilleure compréhension de l'approche pratique du sujet dans le monde réel. Ainsi, 
cela aidera à maintenir le dossier complet de la documentation du projet dans une 
plate-forme organisée. Ainsi, ce système d'allocation et d'évaluation des 
soumissions de projets étudiants pourra répondre à un large éventail d'exigences, 
que ce soit pour les étudiants ou pour un instructeur dans des établissements 
d'enseignement.

#### TRAVAUX PROPOSÉS :

1. Module d'inscription ou de connexion :
Chaque nouvel utilisateur doit d'abord demander un identifiant de connexion ainsi 
qu'un mot de passe qu'il pourra modifier ultérieurement.
On créera des utilisateurs comme suivant :
Nom et prénoms, date de naissance, N° Etudiant ou enseignant.
Prévoir 3 rôles pour étudiant, enseignant et administrateur
2. Module de chargement/téléchargement :
Ce module est utilisé par l'instructeur pour donner les instructions nécessaires 
concernant le projet/devoir et les étudiants peuvent visualiser le module 
d'instruction. L'instructeur peut autoriser des tâches à leurs étudiants respectifs. 
Les étudiants peuvent télécharger la tâche qui leur est assignée et peuvent 
travailler dessus et plus tard, ils peuvent soumettre leur travail pour révision. 
L'instructeur peut donner des avis/notes sur le travail proposé
Pour ce module, crée un modèle avec l’intitulé du projet, la matière à la quelle le 
projet est lié, le projet en fichier voir annexe, statut (en cours, soumis, corrigé, 
traité, archivé)
3. Module de soumission précédent :
Ce module est proposé pour maintenir les détails du projet/du devoir précédent 
afin que les étudiants ou les instructeurs puissent voir les résumés des projets 
précédents. Ils peuvent le télécharger pour d'autres usages ou le mettre à jour 
pendant la date limite.
Ici permettre à l’étudiant de voir la liste des projets archivés.
4. Module utilisateur :
Ce module est destiné à l'étudiant et à l'enseignant où ils peuvent voir tous leurs 
cours en cours et peuvent voir tout ce qui concerne le cours. Ils peuvent également 
mettre à jour leur profil ici.
5. Ouvrez le module de projet :
Ce module sera utilisé pour des projets ouverts qui peuvent être réalisés par 
n'importe quel étudiant. Chaque instructeur et les autres étudiants peuvent voir 
ces projets et examiner le problème. Ces projets peuvent être créés par n'importe 
quel instructeur et n'importe qui peut y travailler.
6. Module d'administration :
Ce module sera utilisé par le responsable de l'Institut, il doit traiter diverses 
fonctions telles que l'attribution des cours, l'attribution des instructeurs, 
l'attribution des étudiants, la sélection des domaines, etc.
Il peut tout voir des étudiants ainsi que de l'instructeur. Il peut utiliser ces données 
pour le rapport d'avancement des étudiants pour l'évaluation de leurs études.
ANNEXE :
CONCEPTION DE LA BASE DE DONNÉES :
Utilisée une base donnée MYSQL
Voici un tuto pour vous aider.
https://codinggear.blog/how-to-connect-mysql-database-with-django/
Notre base de données acceptera des données de types : -
1) Caractère ou chaîne (maxlength :3000)
2) Entier
3) Date et heure
4) Pdf, zip ou autre document similaire (taille max : 5 Mo)
5) images (type : jpeg, png, jpg, gif, etc.) (tailles maximales : 5 Mo)
DESIGN :
Le design est laissé au choix de l’étudiant vous pourrez utiliser des Framework
comme Bootstrap ou Tailwind pour le style.
SOUMISSION
Vous créerez un repo public GitHub où vous hébergerez le projet. 
En plus du projet, vous allez documenter dans un fichier readme, les prérequis 
pour installer vos projets et aussi les instructions pour faire l’installation.
Si possible les identifiants du super admin.
Vous fournirez aussi un dump SQL de votre base de données sur le repo.



<br />

## Table of Contents

* [Quick Start](#quick-start)
* [File Structure](#file-structure)

* [ID du super User](#id-du-super-User)

<br />

## Quick start

> Décompressez les sources ou clonez le dépôt. Après avoir obtenu le code, ouvrez un terminal et naviguez vers le répertoire de travail, avec le code source du produit.

```bash
$ git clone https://github.com/soo-essoklina-ulrich/SCHOOL_DJANGO_PROJECT.git
$ cd SCHOOL_DJANGO_PROJECT
```

<br />

### 👉 Mise en place `windows`

> Installer des modules via `VENV`  

```bash
$ python -m venv venv
$ .\env\Scripts\activate  
$ pip3 install -r requirements.txt
```

<br />

> Mise en place de la base de données

dans le fichier `.env` se trouve la configuration pour la base de données, mais avant cela nous devons :

<b><li>__Etape 1 :__ Creer un basse de Données pour l'application </li></b>
<p>Creer votre Base de Donne dans le SGBD "mysql" pour le Project <br> en suite dans le fichier <b>.env</b>  Veuiller renseignet les donne de connexion  ainsi que le nom de la base de données creer</p>

> Exemple : 
```bash
#for database
DATABASE_NAME=nom_de_la_base_de_données
DATABASE_USER=nom_d_utilisateur
DATABASE_PASSWORD=mot_de_passe
DATABASE_HOST= localhost
DATABASE_PORT= 3306
```

```bash
#for mail
EMAIL_HOST = 
EMAIL_HOST_USER = 
EMAIL_HOST_PASSWORD = 
EMAIL_PORT = 
```

<p> viens creer compte mailtrap puis renseigener les info restant dans le `.env`  pour l'envoie de mail ou si vous avec un autre moyen de transfert de mail utiliser les. Je vous conseils de vous documents par vous même</p>
<b><li>Etape 2 : import les migrations </li></b> 
<br>
avec le fichier dump.sql fourni dans le dossier du projet, importer le dans votre base de données
<br>
or 

<br/>

```bash
$ python manage.py makemigrations
$ python manage.py migrate
```

<br />

> Démarrer l'application

```bash
$ python manage.py runserver
```

À ce stade, l'application fonctionne à `http://127.0.0.1:8000/`. 

> Note : Pour utiliser l'application, veuillez accéder à la page d'enregistrement et créer un nouvel utilisateur. Après authentification, l'application déverrouillera les pages privées.



<br />

## File Structure
Dans le téléchargement, vous trouverez les répertoires et les fichiers suivants :

```bash
< PROJECT ROOT >
   |
   |-- school/                            # Implements app configuration
   |    |-- settings.py                    # Defines Global Settings
   |    |-- wsgi.py                        # Start the app in production
   |    |-- urls.py                        # Define URLs served by all apps/nodes
   |    |-- asgi.py                        # Start the app in development
   |    |-- context_processors.py          # Define context processors
   |
   |
   |-- devoirs/                # Handles auth routes (login and register)
   |    |-- urls.py                   # Define module 2 & 3 routes  
   |    |-- views.py                  # Handles methode for module 2 & 3
   |    |-- forms.py                  # Define form for module 2 & 3
   |
   |-- authentication/         # Handles auth routes (login and register)
   |    |-- urls.py                   # Define authentication routes  
   |    |-- views.py                  # Handles login, profile and registration  
   |    |-- forms.py                  # Define auth forms 
   |
   |-- media/                  # upload files
   |    |--                      # CSS files, Javascripts files
   |
   |-- static/asstes/                 # Static files (overriding templates)
   |    |-- <css, JS, images>         # CSS files, Javascripts files
   |
   |-- templates/              # Templates used to render pages
   |     |-- includes/                 # HTML chunks and components
   |     |    |-- navigation.html      # Top menu component
   |     |    |-- sidebar.html         # Sidebar component
   |     |    |-- footer.html          # App Footer
   |     |    |-- scripts.html         # Scripts common to all pages
   |     |
   |     |-- layouts/          # Master pages
   |     |    |-- base-fullscreen.html  # Used by Authentication pages
   |     |    |-- base.html             # Used by common pages
   |     |
   |     |-- authentication/   # Authentication pages
   |     |    |-- login.html            # Login page
   |     |    |-- register.html         # Register page
   |     |    |-- profil.html           # Profile page
   |     |
   |     |-- devoirs/          # UI Kit Pages
   |          |-- index.html            # Index page
   |          |-- *.html                # All other pages
   |
   |-- requirements.txt                     # Development modules
   |
   |-- dump.sql                             # Database dump
   |
   |-- .env                                 # Inject Configuration via Environment
   |-- manage.py                            # Start the app - Django default start script
   |
   |-- ************************************************************************
```

<br />

> Le flux d'amorçage de l'application est le suivant :

- Le bootstrapper de Django `manage.py` utilise `school/settings.py` comme fichier de configuration principal.
- `school/settings.py` charge la magie de l'application à partir du fichier `.env`
- Redirige les utilisateurs invités vers la page de connexion
- Déverrouille les pages servies par *app* node pour les utilisateurs authentifiés


<br />

## ID du super User
Username : **school**

Email address: **admin@school.projet** 

ID: **sooulr000**

Password: **Esso_9338**