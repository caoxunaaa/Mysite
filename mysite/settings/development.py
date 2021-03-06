"""
Django settings for mysite project.

Generated by 'django-admin startproject' using Django 3.0.6.

For more information on this file, see
https://docs.djangoproject.com/en/3.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/3.0/ref/settings/
"""

import os
from .base import *

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '9#u-=my=)=7ycj3nlrh%__dd)4z3^@)!x=uj_9_^@xw(^eajbk'
# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# Application definition

# Database
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases
'''
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}
'''

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mysite_db',
        'USER': 'caoxun',
        'PASSWORD': 'caoxun8500139',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

# 邮件设置
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.qq.com'
EMAIL_PORT = 25
EMAIL_HOST_USER = '451501060@qq.com'
EMAIL_HOST_PASSWORD = 'oxzniaphxnntbhfe'
EMAIL_SUBJECT_PREFIX = '[Django] '
EMAIL_USE_TSL = True
