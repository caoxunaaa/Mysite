from django import template
from read_statistics.models import ReadStatistics
from django.contrib.contenttypes.models import ContentType

register = template.Library()


@register.simple_tag
def get_blog_readnum_count(obj):
    ct = ContentType.objects.get_for_model(obj)
    readstatistics, created = ReadStatistics.objects.get_or_create(content_type=ct, object_id=obj.pk)
    return readstatistics.read_num
