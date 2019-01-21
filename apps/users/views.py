# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, redirect
from django.views.generic import View, TemplateView
from django.contrib.auth import login, logout
from django.http import JsonResponse

from .forms import AuthenticationForm


class LoginView(View):
    """
    Base View for login requests

    Methods:
        get - render a login.html page
        post - processing login form request and return json
    """
    form_class = AuthenticationForm
    template_name = 'login.html'

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated():
            return redirect('/')
        return render(
            request,
            self.template_name,
            {'form': self.form_class() }
        )

    def post(self, request, *args, **kwargs):

        form = self.form_class(request.POST)
        if form.is_valid(): # in this form is_valid method also calls authenticate method and store an user
            login(request, form.get_user())
            return redirect('/')
        else:
            return JsonResponse({
                'success': False,
                'errors': form.errors.as_json()
            })


class LogoutView(View):
    """
    View for logout get requests
    """
    def get(self, request, *args, **kwargs):
        logout(request)
        return redirect('/')



class HomeFeedView(TemplateView):
    template_name = 'home.html'