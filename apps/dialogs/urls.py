# -*- coding: utf-8 -*-

from django.conf.urls import url, include

from .api import DialogsList, DialogDetail, UserAnswerCreate

urlpatterns = [
    url(r'^dialogs/', DialogsList.as_view(), name="dialogs"),
    url(r'^dialog/(?P<pk>[0-9]+)/', DialogDetail.as_view(), name="dialog"),
    url(r'^useranswers/', UserAnswerCreate.as_view(), name="useranswers"),
]
