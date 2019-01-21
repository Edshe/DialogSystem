# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Questionnaire(models.Model):
    """
    Model represents a questionnaire
    that user can choice and go through.
    """
    name = models.CharField(
        verbose_name="Name",
        max_length=50)

    def __str__(self):
        return "{}: {}".format(self.id, self.name)

    @property
    def questions(self):
        return Question.objects.filter(questionnaire_id=self.id)

    @property
    def first_question_id(self):
        if self.questions.exists():
            return self.questions.order_by('position')[0].id
        return None


class Question(models.Model):
    """
    Model represents question that user can answer to.
    Every question belongs to some Questionaire.
    """
    questionnaire = models.ForeignKey(
        Questionnaire,
        verbose_name="Questionnaire")

    text = models.CharField(
        verbose_name="Question text",
        max_length=100)

    position = models.SmallIntegerField(
        verbose_name="Position",
        default=0,
        help_text = "The smaller the first",
    )
    class Meta:
        ordering = ['position',]

    def __str__(self):
        return "{}: {}".format(self.questionnaire.name, self.text)

    def answers(self):
        return Choice.objects.filter(question_id=self.id)


class Choice(models.Model):
    """
    Model represents Choice for a Question.
    """
    question = models.ForeignKey(
        Question,
        verbose_name="Question",
        related_name="choices",
        help_text="Question the choice belongs to")
    next_question = models.ForeignKey(
        Question,
        verbose_name="Next question",
        null=True,
        blank=True,
        help_text="Link to next question. If exist.")

    text = models.CharField(
        verbose_name="Choice text",
        max_length=150)

    finish = models.ForeignKey(
        'QuestionnaireFinishText',
        verbose_name="Is finish",
        null=True,
        blank=True,
        help_text="If specified - a dialog will be finished on this choice")

    def __str__(self):
        return self.text




class QuestionnaireFinishText(models.Model):
    """
    Model represents system's answer for a Choice
    if the Choice means exit from Questionnaire.
    """
    text = models.CharField(
        verbose_name="Choice text",
        max_length=150)

    def __str__(self):
        return self.text