from django.shortcuts import render, redirect
from django.contrib import auth
from .forms import LoginForm, RegisterForm, EditNicknameForm
from django.urls import reverse
from django.contrib.auth.models import User
from .models import Profile
from django.http import JsonResponse


def login_for_modal(request):
    login_form = LoginForm(request.POST)
    data = dict()
    if login_form.is_valid():
        user = login_form.cleaned_data['user']
        auth.login(request, user)
        data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)


def login(request):
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user = login_form.cleaned_data['user']
            auth.login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        login_form = LoginForm()

    context = dict()
    context['login_form'] = login_form
    return render(request, 'user/login.html', context)


def register(request):
    if request.method == 'POST':
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            email = register_form.cleaned_data['email']
            password = register_form.cleaned_data['password']
            user = User.objects.create_user(username=username, email=email, password=password)
            user.save()
            user = auth.authenticate(username=username, password=password)
            auth.login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        register_form = RegisterForm()
    context = dict()
    context['register_form'] = register_form
    return render(request, 'user/register.html', context)


def logout(request):
    auth.logout(request)
    return redirect(reverse('home'))


def user_info(request):
    return render(request, 'user/user_info.html')


def edit_nickname(request):
    redirect_to = request.GET.get('from', reverse('home'))
    if request.method == 'POST':
        edit_nickname_form = EditNicknameForm(request.POST, user=request.user)
        if edit_nickname_form.is_valid():
            user = edit_nickname_form.cleaned_data['user']
            new_nickname = edit_nickname_form.cleaned_data['new_nickname']
            profile, created = Profile.objects.get_or_create(user=user)
            profile.nickname = new_nickname
            profile.save()
            return redirect(redirect_to)
    else:
        edit_nickname_form = EditNicknameForm()

    context = dict()
    context['form'] = edit_nickname_form
    return render(request, 'user/edit_nickname.html', context)
