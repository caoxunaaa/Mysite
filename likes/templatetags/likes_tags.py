from django import template
from likes.models import LikesCount
from django.contrib.contenttypes.models import ContentType

register = template.Library()


@register.simple_tag
def get_likes_count(obj):
    ct = ContentType.objects.get_for_model(obj)
    likescount, created = LikesCount.objects.get_or_create(content_type=ct, object_id=obj.pk)
    return likescount.likes_number


@register.simple_tag
def get_dislikes_count(obj):
    ct = ContentType.objects.get_for_model(obj)
    dislikescount, created = LikesCount.objects.get_or_create(content_type=ct, object_id=obj.pk)
    return dislikescount.dislikes_number
