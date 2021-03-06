# Generated by Django 3.0.6 on 2020-06-11 01:56

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        ('likes', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='likesrecord',
            name='is_like',
            field=models.BooleanField(default=True),
            preserve_default=False,
        ),
        migrations.CreateModel(
            name='DislikesCount',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField()),
                ('dislikes_number', models.IntegerField(default=0, verbose_name='嫌弃数')),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.ContentType')),
            ],
        ),
    ]
