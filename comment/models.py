from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from ckeditor.fields import RichTextField


class Comment(models.Model):
    user = models.ForeignKey(User, verbose_name='评论者',related_name='comment', on_delete=models.CASCADE)
    context = models.TextField(verbose_name='评论内容')
    commented_time = models.DateTimeField(verbose_name='评论时间', auto_now_add=True)

    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    root = models.ForeignKey('self', related_name='root_comment', on_delete=models.CASCADE, blank=True, null=True)
    parent = models.ForeignKey('self', related_name='parent_comment', on_delete=models.CASCADE, blank=True, null=True)
    reply_to = models.ForeignKey(User, related_name='replies', on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        ordering = ['-commented_time']
