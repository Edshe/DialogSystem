# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import models
from .base_models import AbstractEmailUser


class User(AbstractEmailUser):
    """
    Main User class for this project
    """
    class Meta:
        swappable = 'AUTH_USER_MODEL'
        verbose_name = u'User'
        verbose_name_plural = u'Users'

    def __str__(self):
        return self.email