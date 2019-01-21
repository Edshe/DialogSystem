# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from ..users.models import User
from ..questionnaires.models import Questionnaire, Choice


class Dialog(models.Model):
    """
    Model represents the Dialogs between system and user.
    Dialog can be linked with some User record and should be linked with some Questionnaire record.

    When User starts a conversation, system creates a new Dialog record. User answers
    during the conversation will be linked to the dialog.
    """
    user = models.ForeignKey(User, verbose_name="User", null=True, blank=True)
    questionnaire = models.ForeignKey(Questionnaire, verbose_name="Questionnaire" )

    created = models.DateTimeField(verbose_name="Creation date", auto_now_add=True)

    class Meta:
        ordering = ['-id']

    def __str__(self):
        if self.user:
            return "%s: %s" % (self.user.email, self.questionnaire.name)
        return self.questionnaire.name

    @property
    def to_str(self):
        """
        String representation of dialog.
        Example: Are you hungry? -> Yes
        """
        if self.answers:
            result = "\n".join(["{} -> {} ->".format(answer[0], answer[1]) for answer in self.dialog_list])
            result = result.replace(' ->  ->', '')
            return result
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

    def get_next_question(self, current):

        return __answers


class UserAnswer(models.Model):
    """
    Model represents an user answers to a questions.
    Every UserAnswer contains an user's Choice to a
    question and belongs to some dialog.
    """
    dialog = models.ForeignKey(Dialog, verbose_name="Dialog", null=True, blank=True)
    choice = models.ForeignKey(Choice, verbose_name="Answer", null=True, blank=True)

    def __str__(self):
        return "%s: %s -> %s" % (str(self.dialog), self.question.text, self.answer.text)

    @property
    def question(self):
        return self.choice.question.text
