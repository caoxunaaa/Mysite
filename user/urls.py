"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('login_for_modal', views.login_for_modal, name='login_for_modal'),
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('register/', views.register, name='register'),
    path('user_info', views.user_info, name='user_info'),
    path('edit_nickname', views.edit_nickname, name='edit_nickname'),
    path('bind_email', views.bind_email, name='bind_email'),
    path('send_verification_code', views.send_verification_code, name='send_verification_code'),
    path('change_password', views.change_password, name='change_password'),
    path('forget_password', views.forget_password, name='forget_password'),
]
