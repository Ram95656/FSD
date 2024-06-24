PORGRAM 4.  

..............Step 1: Create a project with name programs
django-admin startproject programs..............

.................Step2: Create an Application inside the project with name app4
py manage.py startapp app4..............

.............Step3: Edit the views.py in Application ‘app4’
views.py (app4)...............

from django.shortcuts import render
from django.http import HttpResponse
def home(request):
  return render(request,'home.html')
def about_us(request):
  return render(request,'about_us.html')
def contact_us(request):
  return render(request,'contact_us.html')

..............Step 4: Create an new file named ‘urls.py’ in app4
urls.py(app4 -> Application name)...............

from django.contrib import admin
from django.urls import path
from . import views
urlpatterns=[
  path('home/',views.home,name='home' ),
  path('about_us/',views.about_us,name='about_us'),
  path('contact_us',views.contact_us,name='contact_us'),
]

................Step 5: Edit the file ‘urls.py’ in project.
urls.py(programs-> Projectname).................

from django.contrib import admin
from django.urls import path,include
urlpatterns = [
  path('admin/', admin.site.urls),
  path('',include('app4.urls')),
]

..............Step 6: Create a folder in application with name ‘templates’
home.html(templates-> app4)...............

{% extends 'layout.html' %}
{% block title %} Home-My Website{% endblock %}
{% block content %}
<h1> Welcome to My Website</h1>
<p>WELCOME TO CEC</p>
{% endblock %}

...................about_us.html(templates-> app4)...................

{% extends 'layout.html' %}
{% block title %} About Us-My Website{% endblock %}
{% block content %}
<h1> About Us</h1>
<p>City Engineering College, Bangalore affiliated to Visvesvaraya Technological University.</p>
{% endblock %}

..................contact_us.html(templates -> app4)..................

{% extends 'layout.html' %}
{% block title %} Contact Us-My Website{% endblock %}
{% block content %}
<h1> Contact Us</h1>
<p>Near Doddakallasandra Metro Station (next to Konana Kunte Signal/Circle Stop)
Doddakalasandra, Bangalore – 560 062.</p>
{% endblock %}

...............layout.html(templates ->app4).................

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>{% block title %} My Website{% endblock %}</title>
</head>
<body>
<header>
<nav>
<ul>
<li><a href={% url 'home' %}">Home</a></li>
<li><a href={% url 'about_us' %}">About us</a></li>
<li><a href={% url 'contact_us' %}">Contact Us</a></li>
</ul>
</nav>
</header>
<main>
{% block content %}
{% endblock %}
</main>
<footer>
<p>&copy;{{year}} My Website. All rights reserved. Developed by CEC</p>
</footer>
</body>
</html>

................Step 6: Edit the settings.py for configuration in project.
settings.py ((programs-> Projectname)....................

INSTALLED_APPS = [
'django.contrib.admin',
'django.contrib.auth',
'django.contrib.contenttypes',
'django.contrib.sessions',
'django.contrib.messages',
'django.contrib.staticfiles',
]
