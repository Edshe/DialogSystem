# -*- coding: utf-8 -*-

from django.conf.urls import url

from .views import DialogsList, DialogDetail, UserAnswerCreate

urlpatterns = [
    url(r'^$', DialogsList.as_view(), name="dialogs"),
    url(r'^dialog/(?P<pk>[0-9]+)/', DialogDetail.as_view(), name="dialog"),
    url(r'^useranswers/', UserAnswerCreate.as_view(), name="useranswers"),
]

