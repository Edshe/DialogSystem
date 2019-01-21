# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.urlresolvers import reverse
from django.test import TestCase

from .models import User
from .forms import AuthenticationForm


class LoginViewTest(TestCase):

    def setUp(self):
        User.objects.create_user(email='test@gmail.com', password='12345')

    def test_LoginView_right_password_auth(self):
        data = dict(
            email='test@gmail.com',
            password='12345'
        )
        response = self.client.post(reverse('users-urls:login'), data=data)
        self.assertEqual(response.status_code, 302)

    def test_LoginView_wrong_password_auth(self):
        data = dict(
            email='test@gmail.com',
            password='zxczx'
        )
        response = self.client.post(reverse('users-urls:login'), data=data)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json().has_key('errors'), True)

    def test_login_page(self):
        response = self.client.get(reverse('users-urls:login'))
        self.assertIsInstance(response.context['form'], AuthenticationForm)
