from django.contrib import admin
from .models import ReadStatistics, ReadStatisticsDetail


# Register your models here.
@admin.register(ReadStatistics)
class ReadStatisticsAdmin(admin.ModelAdmin):
    list_display = ('read_num', 'content_object',)


@admin.register(ReadStatisticsDetail)
class ReadStatisticsDetailAdmin(admin.ModelAdmin):
    list_display = ('read_num', 'date', 'content_object',)
