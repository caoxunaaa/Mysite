from django.shortcuts import render
from .models import LikesCount, LikesRecord
from django.contrib.contenttypes.models import ContentType
from django.http import JsonResponse


def like_change(request):
    content_type = request.GET.get('contenttype')
    object_id = request.GET.get('object_id')
    is_like = request.GET.get('is_like')
    user = request.user
    data = dict()
    if user.is_authenticated:
        ct = ContentType.objects.get(model=content_type)
        likes_count, created = LikesCount.objects.get_or_create(content_type=ct, object_id=object_id)
        is_like = True if is_like == 'true' else False
        likes_record, record_created = LikesRecord.objects.get_or_create(content_type=ct, object_id=object_id,
                                                                         likes_user=user)

        if is_like:
            if record_created:
                likes_count.likes_number += 1
            elif likes_record.is_like:
                pass
            else:
                likes_count.likes_number += 1
                likes_count.dislikes_number -= 1
                likes_record.is_like = True
        else:
            if record_created:
                likes_count.dislikes_number += 1
            elif likes_record.is_like:
                likes_count.likes_number -= 1
                likes_count.dislikes_number += 1
                likes_record.is_like = False
            else:

                pass

        likes_count.save()
        likes_record.save()

        data['status'] = 'SUCCESS'
        data['like_number'] = likes_count.likes_number
        data['dislike_number'] = likes_count.dislikes_number
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)
