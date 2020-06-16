import random
import time
import string
from django.shortcuts import render, redirect
from django.contrib import auth
from .forms import LoginForm, RegisterForm, EditNicknameForm, BindEmailForm
from django.urls import reverse
from django.contrib.auth.models import User
from .models import Profile
from django.http import JsonResponse
from django.core.mail import send_mail


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
    if request.user.is_authenticated:
        # return redirect(reverse('home'))
        return redirect(request.GET.get('from', reverse('home')))
        # return render(request, 'home.html')
    else:
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


def bind_email(request):
    redirect_to = request.GET.get('from', reverse('home'))

    if request.method == 'POST':
        bind_email_form = BindEmailForm(request.POST, request=request)
        if bind_email_form.is_valid():
            email = bind_email_form.cleaned_data['email']
            request.user.email = email
            request.user.save()
            return redirect(redirect_to)
    else:
        bind_email_form = BindEmailForm()

    context = dict()
    context['form'] = bind_email_form
    return render(request, 'user/bind_email.html', context)


def send_verification_code(request):
    email = request.GET.get('email', '')
    print(email)
    data = dict()
    if email != '':
        code = ''.join(random.sample(string.ascii_letters + string.digits, 4))
        now = int(time.time())
        send_code_time = request.session.get('send_code_time', 0)

        if now - send_code_time < 30:
            print('30秒内不能刷新验证码')
            data['status'] = 'ERROR'
        else:
            request.session['bind_email_code'] = code
            request.session['send_code_time'] = now

            send_mail('绑定邮箱',
                      '验证码为： {}'.format(code),
                      '451501060@qq.com',
                      [email],
                      fail_silently=False,
                      )
            data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)
