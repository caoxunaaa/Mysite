from django.db import models
from django.contrib.auth.admin import User
from ckeditor_uploader.fields import RichTextUploadingField


class BlogType(models.Model):
    type_name = models.CharField('分类标签', max_length=30)

    def __str__(self):
        return self.type_name


class Blog(models.Model):
    title = models.CharField('标题', max_length=30)
    auth = models.ForeignKey(User, verbose_name='作者', on_delete=models.CASCADE)
    blog_type = models.ForeignKey(BlogType, verbose_name='分类', on_delete=models.CASCADE)
    # content = models.TextField('正文')
    content = RichTextUploadingField('正文')
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    updated_time = models.DateTimeField('更新时间', auto_now=True)
    is_delete = models.BooleanField(default=False)

    def __str__(self):
        return self.title
