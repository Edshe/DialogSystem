# -*- coding: utf-8 -*-
# Generated by Django 1.11.18 on 2019-01-16 14:20
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('dialogs', '0002_dialog_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dialog',
            name='user',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='User'),
        ),
    ]
