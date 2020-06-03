from .models import ReadStatistics, ReadStatisticsDetail
from django.utils import timezone
import datetime
from django.contrib.contenttypes.models import ContentType
from django.db.models import Sum


def read_once_statistics(request, obj):
    ct = ContentType.objects.get_for_model(obj)
    # 添加Cookie防止阅读量错误
    key = '{}_{}_read'.format(ct.model, obj.pk)
    if not request.COOKIES.get(key):
        readstatistics, created = ReadStatistics.objects.get_or_create(content_type=ct, object_id=obj.pk)
        readstatistics.read_num += 1
        readstatistics.save()

        readstatistics_detail, created = ReadStatisticsDetail.objects.get_or_create(content_type=ct, object_id=obj.pk)
        readstatistics_detail.read_num += 1
        readstatistics_detail.save()
    return key


def weeks_read_statistics(obj):
    ct = ContentType.objects.get_for_model(obj)
    today = timezone.now().date()
    # date_list = list()
    # result_list = list()
    weeks_read_number = dict()
    for i in reversed(range(7)):
        date = today - datetime.timedelta(days=i)
        # date_list.append(date.strftime('%m/%d'))
        result = ReadStatisticsDetail.objects.filter(content_type=ct, date=date).aggregate(
            blog_read_num=Sum('read_num'))
        # result_list.append(result['blog_read_num'] or 0)
        weeks_read_number[date.strftime('%m/%d')] = result['blog_read_num'] or 0
    return weeks_read_number
