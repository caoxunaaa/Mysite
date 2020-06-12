from django import template
from comment.models import Comment
from django.contrib.contenttypes.models import ContentType
from ..forms import CommentForm

register = template.Library()


@register.simple_tag
def get_comment_count(obj):
    ct = ContentType.objects.get_for_model(obj)
    return Comment.objects.filter(content_type=ct, object_id=obj.pk).count()


@register.simple_tag
def get_comment_form(obj):
    ct = ContentType.objects.get_for_model(obj)
    return CommentForm(initial={'content_type': ct.model, 'object_id': obj.pk, 'replay_to_object_pk': 0})


@register.simple_tag
def get_comment_list(obj):
    ct = ContentType.objects.get_for_model(obj)
    comments = Comment.objects.filter(content_type=ct, object_id=obj.pk, parent=None)
    return comments.order_by('commented_time')
