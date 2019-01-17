# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, \
    PermissionsMixin

import fields
from .managers import EmailUserManager


class AbstractEmailUser(AbstractBaseUser, PermissionsMixin):
    """
    User class that copies Django's default user,
    but uses email field insted of username
    """
    email = fields.EmailField('Email', max_length=254, unique=True)
    is_staff = models.BooleanField(
        'Staff status',
        default=False,
        help_text='Designates whether the user can log into this admin site.',
    )
    is_active = models.BooleanField(
        'Active',
        default=True,
        help_text= 'Designates whether this user should be treated as active.  \
                  Unselect this instead of deleting accounts.'

    )
    date_joined = models.DateTimeField('Date joined', auto_now_add=True)

    objects = EmailUserManager()

    USERNAME_FIELD = 'email'

    class Meta:
        verbose_name = 'User'
        verbose_name_plural = 'Users'
        abstract = True


    def get_full_name(self):
        return self.email

    def get_short_name(self):
        return self.email.split('@')[0]