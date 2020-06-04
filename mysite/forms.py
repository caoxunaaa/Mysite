from django import forms
from django.contrib import auth


class LoginForm(forms.Form):
    username = forms.CharField(label='用户',
                               widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': '请输入用户名'}))
    password = forms.CharField(label='密码',
                               widget=forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': '请输入密码'}))

    def clean(self):
        username = self.cleaned_data['username']
        password = self.cleaned_data['password']
        user = auth.authenticate(username=username, password=password)
        if user:
            self.cleaned_data['user'] = user
        else:
            raise forms.ValidationError('用户密码不正确')
        return self.cleaned_data


class RegisterForm(forms.Form):
    username = forms.CharField(label='用户名', min_length=6, max_length=30,
                               widget=forms.TextInput(attrs={'class': 'form-control', 'placeholder': '请输入用户名'}))
    email = forms.EmailField(label='邮箱',widget=forms.EmailInput(attrs={'class': 'form-control', 'placeholder': '请输入邮箱'}))
    birthday = forms.DateField(label='出生日期', widget=forms.DateInput(attrs={'class': 'form-control'}))
