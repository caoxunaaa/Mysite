from django.contrib import admin
from .models import LikesCount, LikesRecord


@admin.register(LikesCount)
class LikesCountAdmin(admin.ModelAdmin):
    list_display = ('id', 'content_object', 'likes_number')
