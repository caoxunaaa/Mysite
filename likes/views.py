from django.shortcuts import render
from .models import LikesCount, LikesRecord
from django.contrib.contenttypes.models import ContentType

# Create your views here.
def like_change(request):
    content_type = request.GET.get('contenttype')
    object_id = request.GET.get('object_id')
    print(content_type, object_id)
    # ct = ContentType.objects.get(model=content_type)
    # likescount, created = LikesCount.objects.get_or_create(content_type=ct, )