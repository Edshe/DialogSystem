# -*- coding: utf-8 -*-

from django.conf.urls import url, include

from .views import LoginView, LogoutView, HomeView

urlpatterns = [
    url(r'^login/', LoginView.as_view(), name="login"),
    url(r'^logout/', LogoutView.as_view(), name="logout"),
    url(r'^$', HomeView.as_view(), name="home"),
]
