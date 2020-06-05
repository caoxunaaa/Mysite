from django.shortcuts import render, redirect
from .forms import CommentForm
from .models import Comment
from django.urls import reverse


def update_comment(request):
    referer = request.META.get('HTTP_REFERER', reverse('home'))
    comment_form = CommentForm(request.POST, user=request.user)
    if comment_form.is_valid():
        comment = Comment()
        comment.user = comment_form.cleaned_data['user']
        comment.content_object = comment_form.cleaned_data['content_object']
        comment.context = comment_form.cleaned_data['text']
        comment.save()
        return redirect(referer)
    else:
        return render(request, 'error.html', {'message': comment_form.errors})
