from django.shortcuts import render
from read_statistics.utils import weeks_read_statistics
from blog.models import Blog


# Create your views here.
def index(request):
    context = dict()
    readnum_week = weeks_read_statistics(Blog)
    context['readnum_week_date'] = list(readnum_week.keys())
    context['readnum_week_num'] = list(readnum_week.values())
    return render(request, 'home.html', context)
