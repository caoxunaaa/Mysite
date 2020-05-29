from django.shortcuts import render
from .models import Blog, BlogType


# Create your views here.
def blog_list(request):
    context = dict()
    context['blogs'] = Blog.objects.filter(is_delete=False)
    context['types'] = BlogType.objects.all()
    return render(request, 'blog/blog_list.html', context)


def blog_with_type(request, blog_type_pk):
    blog_type = BlogType.objects.get(pk=blog_type_pk)
    context = dict()
    context['blogs'] = Blog.objects.filter(blog_type=blog_type)
    context['types'] = BlogType.objects.all()
    return render(request, 'blog/blog_list.html', context)


def blog_detail(request, blog_pk):
    context = dict()
    context['blog'] = Blog.objects.get(pk=blog_pk, is_delete=False)
    context['types'] = BlogType.objects.all()
    return render(request, 'blog/blog_detail.html', context)
