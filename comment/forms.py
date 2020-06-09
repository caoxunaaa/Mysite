from django import forms
from django.contrib.contenttypes.models import ContentType
from ckeditor.widgets import CKEditorWidget
from django.db.models import ObjectDoesNotExist
from .models import Comment


class CommentForm(forms.Form):
    content_type = forms.CharField(widget=forms.HiddenInput)
    object_id = forms.IntegerField(widget=forms.HiddenInput)
    text = forms.CharField(label='评论', widget=CKEditorWidget(config_name='comment_ckeditor'))
    replay_to_object_pk = forms.IntegerField(widget=forms.HiddenInput(attrs={'id': 'replay_to_object_pk'}))

    def __init__(self, *args, **kwargs):
        if 'user' in kwargs:
            self.user = kwargs.pop('user')
        super(CommentForm, self).__init__(*args, **kwargs)

    def clean(self):
        # 验证用户是否登录
        if self.user.is_authenticated:
            self.cleaned_data['user'] = self.user

        # 验证评论对象
        content_type = self.cleaned_data['content_type']
        object_id = self.cleaned_data['object_id']
        try:
            model_class = ContentType.objects.get(model=content_type).model_class()
            model_obj = model_class.objects.get(pk=object_id)
            self.cleaned_data['content_object'] = model_obj
        except ObjectDoesNotExist:
            raise forms.ValidationError('评论对象不存在')

        return self.cleaned_data

    def clean_replay_to_object_pk(self):
        replay_to_object_pk = self.cleaned_data['replay_to_object_pk']
        if replay_to_object_pk < 0:
            raise forms.ValidationError('回复对象不存在')
        elif replay_to_object_pk == 0:
            self.cleaned_data['parent'] = None
        elif Comment.objects.filter(pk=replay_to_object_pk).exists():
            self.cleaned_data['parent'] = Comment.objects.get(pk=replay_to_object_pk)
        else:
            raise forms.ValidationError('回复出错')
        return replay_to_object_pk
