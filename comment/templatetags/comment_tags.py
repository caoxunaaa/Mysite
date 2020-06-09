from django import template
from comment.models import Comment
from django.contrib.contenttypes.models import ContentType

register = template.Library()


@register.simple_tag
def get_comment_count(obj):
    ct = ContentType.objects.get_for_model(obj)
    return Comment.objects.filter(content_type=ct, object_id=obj.pk).count()
