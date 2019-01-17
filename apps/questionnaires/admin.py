# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from .models import Questionnaire, Question, Choice, QuestionnaireFinishText


class QuestionInLine(admin.StackedInline):
    model = Question


@admin.register(Questionnaire)
class QuestionnaireAdmin(admin.ModelAdmin):
    list_display = ('name',)
    inlines = [
        QuestionInLine,
    ]


class ChoiceInLine(admin.StackedInline):
    model = Choice
    fk_name = 'question'


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ('questionnaire', 'text')
    inlines = [
        ChoiceInLine,
    ]


@admin.register(Choice)
class ChoiceAdmin(admin.ModelAdmin):
    list_display = ('question', 'text')


@admin.register(QuestionnaireFinishText)
class QuestionnaireFinishTextAdmin(admin.ModelAdmin):
    list_display = ('text', )
