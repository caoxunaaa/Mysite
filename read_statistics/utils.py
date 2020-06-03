from .models import ReadStatistics, ReadStatisticsDetail
from django.utils import timezone
import datetime
from django.contrib.contenttypes.models import ContentType
from django.db.models import Sum
from django.db.models.fields import exceptions


class ReadNumDisplay:
    def readnum(self):
        ct = ContentType.objects.get_for_model(self)
        try:
            return ReadStatistics.objects.get(content_type=ct, object_id=self.pk).read_num
        except exceptions.ObjectDoesNotExist:
            return 0


def read_once_statistics(request, obj):
    ct = ContentType.objects.get_for_model(obj)
    # 添加Cookie防止阅读量错误
    key = '{}_{}_read'.format(ct.model, obj.pk)
    if not request.COOKIES.get(key):
        readstatistics, created = ReadStatistics.objects.get_or_create(content_type=ct, object_id=obj.pk)
        readstatistics.read_num += 1
        readstatistics.save()

        date = timezone.now().date()
        readstatistics_detail, created = ReadStatisticsDetail.objects.get_or_create(content_type=ct, object_id=obj.pk,
                                                                                    date=date)
        readstatistics_detail.read_num += 1
        readstatistics_detail.save()
    return key


def weeks_read_statistics(content_type):
    today = timezone.now().date()
    weeks_read_number = dict()
    for i in reversed(range(7)):
        date = today - datetime.timedelta(days=i)
        result = ReadStatisticsDetail.objects.filter(content_type=content_type, date=date).aggregate(
            blog_read_num=Sum('read_num'))
        weeks_read_number[date.strftime('%m/%d')] = result['blog_read_num'] or 0
    return weeks_read_number


def today_hot_read(content_type):
    today = timezone.now().date()
    return ReadStatisticsDetail.objects.filter(content_type=content_type, date=today).order_by('-read_num')[:3]


def yesterday_hot_read(content_type):
    today = timezone.now().date()
    yesterday = today - datetime.timedelta(days=1)
    return ReadStatisticsDetail.objects.filter(content_type=content_type, date=yesterday).order_by('-read_num')[:3]



