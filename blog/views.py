from django.shortcuts import render, get_object_or_404
from .models import Blog, BlogType
from django.core.paginator import Paginator
from mysite import settings
from django.db.models import Count
from read_statistics.utils import read_once_statistics
from django.contrib.contenttypes.models import ContentType
from comment.forms import CommentForm
from comment.models import Comment


def get_common_data(request, obj_list):
    paginator = Paginator(obj_list, settings.EACH_PAGE_BLOGS_NUMBER)
    page = request.GET.get('page', 1)  # 获取请求的页码数
    page_of_blog = paginator.get_page(page)

    blog_dates = Blog.objects.dates('created_time', 'month', order='DESC')
    blog_date_dict = {}
    for blog_date in blog_dates:
        blog_date_count = Blog.objects.filter(created_time__year=blog_date.year, created_time__month=blog_date.month,
                                              is_delete=False).count()
        blog_date_dict[blog_date] = blog_date_count

    context = dict()
    context['blogs'] = page_of_blog
    context['types'] = BlogType.objects.annotate(blog_count=Count('blog'))
    context['dates'] = blog_date_dict
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
    current_blog = get_object_or_404(Blog, pk=blog_pk, is_delete=False)
    all_blogs = Blog.objects.filter(is_delete=False)
    key = read_once_statistics(request, obj=current_blog)
    blog_ct = ContentType.objects.get_for_model(current_blog)
    comments = Comment.objects.filter(content_type=blog_ct, object_id=blog_pk, parent=None)

    context = get_common_data(request, all_blogs)
    context['blog'] = current_blog
    context['comments'] = comments
    context['pervious_blog'] = Blog.objects.filter(created_time__lt=current_blog.created_time).last()
    context['next_blog'] = Blog.objects.filter(created_time__gt=current_blog.created_time).first()
    context['comment_form'] = CommentForm(initial={'content_type': blog_ct.model, 'object_id': blog_pk})
    response = render(request, 'blog/blog_detail.html', context)
    response.set_cookie(key=key, value='True')
    return response
