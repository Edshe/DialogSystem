# -*- coding: utf-8 -*-

from django.conf.urls import url, include

from .api import QuestionnaireList, QuestionDetail

urlpatterns = [
    url(r'^questionnaires/', QuestionnaireList.as_view(), name="questionnaires"),

    url(r'^question/(?P<pk>[0-9]+)/', QuestionDetail.as_view(), name="question"),
]
