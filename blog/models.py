from django.db import models
from django.contrib.auth.admin import User
from ckeditor_uploader.fields import RichTextUploadingField
from read_statistics.utils import ReadNumDisplay
from read_statistics.models import ReadStatisticsDetail
from django.contrib.contenttypes.fields import GenericRelation
from django.urls import reverse


class BlogType(models.Model):
    type_name = models.CharField('分类标签', max_length=30)

    def __str__(self):
        return self.type_name


class Blog(models.Model, ReadNumDisplay):
    title = models.CharField('标题', max_length=30)
    auth = models.ForeignKey(User, verbose_name='作者', on_delete=models.CASCADE)
    blog_type = models.ForeignKey(BlogType, verbose_name='分类', on_delete=models.CASCADE)
    content = RichTextUploadingField('正文')
    read_stistics_detail = GenericRelation(ReadStatisticsDetail)
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    updated_time = models.DateTimeField('更新时间', auto_now=True)
    is_delete = models.BooleanField(default=False)

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['pk']

    def get_url(self):
        return reverse('blog_detail', kwargs={'blog_pk': self.pk})
