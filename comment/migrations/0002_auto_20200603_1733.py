# Generated by Django 3.0.6 on 2020-06-03 09:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('comment', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='comment',
            old_name='contenttype',
            new_name='content_type',
        ),
    ]
