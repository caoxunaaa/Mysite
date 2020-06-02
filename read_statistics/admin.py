from django.contrib import admin
from .models import ReadStatistics


# Register your models here.
@admin.register(ReadStatistics)
class ReadStatisticsAdmin(admin.ModelAdmin):
    list_display = ('read_num', 'content_object',)
