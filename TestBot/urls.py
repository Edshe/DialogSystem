    # -*- coding: utf-8 -*-
from django.conf.urls import url, include
from django.contrib import admin

from apps.users.views import HomeFeedView, LoginView, LogoutView
from apps.users import urls as users_urls

from apps.questionnaires.api import urls as questionnaires_api
from apps.dialogs.api import urls as dialogs_api

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^$', HomeFeedView.as_view(), name='home'),
    url(r'^login/', LoginView.as_view(), name="login"),
    url(r'^logout/', LogoutView.as_view(), name="logout"),

    url(r'^api/questionnaires/', include(questionnaires_api, 'questionnaires-api')),
    url(r'^api/dialogs/', include(dialogs_api, 'dialogs-api')),
]
