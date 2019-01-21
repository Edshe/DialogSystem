# -*- coding: utf-8 -*-

from django.conf.urls import url

from .views import QuestionnaireList, QuestionDetail


urlpatterns = [
    url(r'^$', QuestionnaireList.as_view(), name="questionnaires"),

    url(r'^question/(?P<pk>[0-9]+)/', QuestionDetail.as_view(), name="question"),
]


