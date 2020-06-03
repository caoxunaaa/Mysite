from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from ckeditor.fields import RichTextField


class Comment(models.Model):
    user = models.ForeignKey(User, verbose_name='评论者', on_delete=models.CASCADE)
    context = RichTextField(verbose_name='评论内容')
    commented_time = models.DateTimeField(verbose_name='评论时间', auto_now_add=True)

    contenttype = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('contenttype', 'object_id')
