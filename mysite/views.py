from django.shortcuts import render
from read_statistics.utils import weeks_read_statistics, yesterday_hot_read, today_hot_read
from blog.models import Blog
from django.contrib.contenttypes.models import ContentType
from django.utils import timezone
import datetime
from django.db.models import Sum
from django.core.cache import cache


def last_week_hot_read():
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
        last_week_hot_blogs = last_week_hot_read()
        cache.set('last_week_hot_blogs', last_week_hot_blogs, 120)
    else:
        print('use cache')

    context['readnum_week_date'] = list(readnum_week.keys())
    context['readnum_week_num'] = list(readnum_week.values())
    context['today_hot_blogs'] = today_hot_read(ct)
    context['yesterday_hot_blogs'] = yesterday_hot_read(ct)
    context['last_week_hot_blogs'] = last_week_hot_blogs
    return render(request, 'home.html', context)
