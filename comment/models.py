from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.core.mail import send_mail
import threading
from django.conf import settings
from django.shortcuts import render


class SendMail(threading.Thread):
    def __init__(self, subject, text, email, fail_silently=False):
        super(SendMail, self).__init__()
        self.subject = subject
        self.text = text
        self.email = email
        self.fail_silently = fail_silently

    def run(self):
        send_mail(
            self.subject,
            '',
            settings.EMAIL_HOST_USER,
            [self.email],
            fail_silently=self.fail_silently,
            html_message=self.text
        )


class Comment(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    context = models.TextField(verbose_name='评论内容')
    commented_time = models.DateTimeField(verbose_name='评论时间', auto_now_add=True)

    user = models.ForeignKey(User, verbose_name='评论者', related_name='comment_reverse', on_delete=models.CASCADE)

    root = models.ForeignKey('self', related_name='root_comment_reverse', on_delete=models.CASCADE, blank=True,
                             null=True)
    parent = models.ForeignKey('self', related_name='parent_comment_reverse', on_delete=models.CASCADE, blank=True,
                               null=True)
    reply_to = models.ForeignKey(User, related_name='replies_reverse', on_delete=models.CASCADE, blank=True, null=True)

    class Meta:
        ordering = ['-commented_time']

    def __str__(self):
        return self.context

    def send_email(self):
        if self.parent is None:
            subject = '有人评论你的博客'
            email = self.content_object.auth.email
        else:
            subject = '有人回复你的评论'
            email = self.reply_to.email
        if email != '':
            context = dict()
            context['comment_text'] = self.context
            context['url'] = self.content_object.get_url()
            text = render(None, 'comment/send_mail.html', context).content.decode('utf-8')
            send_mail = SendMail(subject, text, email)
            send_mail.start()
