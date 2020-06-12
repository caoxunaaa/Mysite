from django.contrib import admin
from .models import Profile
from django.contrib.auth.models import User


class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False


class UserAdmin(admin.ModelAdmin):
    inlines = [ProfileInline]
    list_display = ('username', 'nickname', 'email', 'is_staff', 'is_active', 'is_superuser')

    def nickname(self, obj):
        return obj.profile.nickname  # 自定义字段显示信息

    nickname.short_description = '昵称'


admin.site.unregister(User)  # 去掉在admin中的注册
admin.site.register(User, UserAdmin)  # 用UserAdmin注册user


@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'nickname')
