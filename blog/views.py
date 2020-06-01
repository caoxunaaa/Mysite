from django.shortcuts import render
from .models import Blog, BlogType
from django.core.paginator import Paginator


def get_common_data(request, obj_list):
    paginator = Paginator(obj_list, 4)
    page = request.GET.get('page', 1)  # 获取请求的页码数
    page_of_blog = paginator.get_page(page)

    context = dict()
    context['blogs'] = page_of_blog
    context['types'] = BlogType.objects.all()
    context['dates'] = Blog.objects.dates('created_time', 'month', order='DESC')
    return context


def blog_list(request):
    blogs = Blog.objects.filter(is_delete=False)
    context = get_common_data(request, blogs)
    return render(request, 'blog/blog_list.html', context)


def blog_with_type(request, blog_type_pk):
    blog_type = BlogType.objects.get(pk=blog_type_pk)
    blogs = Blog.objects.filter(is_delete=False, blog_type=blog_type)
    context = get_common_data(request, blogs)
    return render(request, 'blog/blog_list.html', context)


def blog_with_date(request, year, month):
    blogs = Blog.objects.filter(created_time__year=year, created_time__month=month, is_delete=False)
    context = get_common_data(request, blogs)
    return render(request, 'blog/blog_list.html', context)


def blog_detail(request, blog_pk):
    context = dict()
    current_blog = Blog.objects.get(pk=blog_pk, is_delete=False)
    context['blog'] = current_blog
    context['pervious_blog'] = Blog.objects.filter(created_time__lt=current_blog.created_time).last()
    context['next_blog'] = Blog.objects.filter(created_time__gt=current_blog.created_time).first()
    context['types'] = BlogType.objects.all()
    return render(request, 'blog/blog_detail.html', context)
