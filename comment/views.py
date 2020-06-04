from django.shortcuts import render


def update_comment(request):
    comment_text = request.POST.get('text', '')
