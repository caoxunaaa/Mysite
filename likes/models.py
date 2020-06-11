from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.auth.models import User


class LikesCount(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    likes_number = models.IntegerField(verbose_name='点赞数', default=0)
    dislikes_number = models.IntegerField(verbose_name='嫌弃数', default=0)


class LikesRecord(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    likes_time = models.DateField(verbose_name='点赞时间', auto_now=True)
    likes_user = models.ForeignKey(User, verbose_name='点赞者', related_name='likes_user_reverse',
                                   on_delete=models.CASCADE)
    is_like = models.BooleanField(default=True)
