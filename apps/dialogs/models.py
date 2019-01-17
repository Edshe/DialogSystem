# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from ..users.models import User
from ..questionnaires.models import Questionnaire, Question, Choice


class Dialog(models.Model):
    """
    Model represents the Dialogs between system and User or AnonymousUser
    Dialog can be linked with some User and should be linked with some Questionnaire
    """
    user = models.ForeignKey(User, verbose_name="User", null=True, blank=True)
    questionnaire = models.ForeignKey(Questionnaire, verbose_name="Questionnaire" )

    created = models.DateTimeField(verbose_name="Creation date", auto_now_add=True)

    def __str__(self):
        if self.user:
            return "%s: %s" % (self.user.email, self.questionnaire.name)
        return self.questionnaire.name

    @property
    def to_str(self):
        if self.answers:
            return "\n".join(["{} -> {}".format(answer[0], answer[1]) for answer in self.dialog_list])
        return self.__str__()

    @property
    def dialog_list(self):
        dialog_list = [(a.choice.question.text, a.choice.text) for a in self.answers]
        if self.answers[-1].choice.finish:
            dialog_list.append((self.answers[-1].choice.finish.text, ''))
        return dialog_list

    @property
    def answers(self):
        if not hasattr(self, '__answers'):
            __answers = list(self.useranswer_set.all())
        return __answers




class UserAnswer(models.Model):
    """
    Model links Dialog, Question and Choice that
    users choice during a conversation
    """
    dialog = models.ForeignKey(Dialog, verbose_name="Dialog", null=True, blank=True)
    choice = models.ForeignKey(Choice, verbose_name="Answer", null=True, blank=True)

    def __str__(self):
        return "%s: %s -> %s" % (str(self.dialog), self.question.text, self.answer.text)

    @property
    def question(self):
        return self.choice.question.text
