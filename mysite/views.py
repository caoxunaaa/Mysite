from django.shortcuts import render, redirect
from read_statistics.utils import weeks_read_statistics, yesterday_hot_read, today_hot_read
from blog.models import Blog
from django.contrib.contenttypes.models import ContentType
from django.utils import timezone
import datetime
from django.db.models import Sum
from django.core.cache import cache
from django.contrib import auth, messages
from .forms import LoginForm
from django.urls import reverse


def last_week_hot_read(contenttype):
    today = timezone.now().date()
    date = today - datetime.timedelta(days=7)
    blogs = Blog.objects.filter(read_stistics_detail__date__gt=date) \
        .values('id', 'title') \
        .annotate(read_statistics_sum=Sum('read_stistics_detail__read_num')) \
        .order_by('-read_statistics_sum')
    return blogs[:3]


def index(request):
    context = dict()
    ct = ContentType.objects.get_for_model(Blog)
    readnum_week = weeks_read_statistics(ct)

    last_week_hot_blogs = cache.get('last_week_hot_blogs')
    if last_week_hot_blogs is None:
        print('set cache')
        last_week_hot_blogs = last_week_hot_read(ct)
        cache.set('last_week_hot_blogs', last_week_hot_blogs, 120)
    else:
        print('use cache')

    context['readnum_week_date'] = list(readnum_week.keys())
    context['readnum_week_num'] = list(readnum_week.values())
    context['today_hot_blogs'] = today_hot_read(ct)
    context['yesterday_hot_blogs'] = yesterday_hot_read(ct)
    context['last_week_hot_blogs'] = last_week_hot_blogs
    return render(request, 'home.html', context)


def login(request):
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user = login_form.cleaned_data['user']
            auth.login(request, user)
            print(request.GET.get('from', reverse('home')))
            return redirect(request.GET.get('from', reverse('home')))
    else:
        login_form = LoginForm()

    context = dict()
    context['login_form'] = login_form
    return render(request, 'login.html', context)


def register(request):
    pass
