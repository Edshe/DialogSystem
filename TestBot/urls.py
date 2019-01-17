# -*- coding: utf-8 -*-
from django.conf.urls import url, include
from django.contrib import admin

from apps.users import urls as users_url
from apps.questionnaires import urls as questionnaires_url
from apps.dialogs import urls as dialogs

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^', include(users_url)),

    url(r'^', include(questionnaires_url)),

    url(r'^', include(dialogs)),
]
