from __future__ import absolute_import, unicode_literals

import re
import requests
import os
import json
import ast
from celery import shared_task

from django.db.models import Q
from django.db import transaction
from django.conf import settings

from ..models import Questionnaire, Question, Choice, QuestionnaireFinishText




# The file in the project folder
FILENAME = 'data.json'


@shared_task
def parse_json():
    Handle().run()


class Handle:
    data = []

    def run(self):
        self._get_data()
        self._create_questionnaire()

    def _get_data(self):
        f = open(os.path.join(settings.BASE_DIR, FILENAME), 'r')
        to_json = ast.literal_eval(f.read())
        self.data = to_json

    @transaction.atomic()
    def _create_questionnaire(self):
        """
            Data is a list of dictionaries.
            Every dict contains questions and answer choices.
        """
        for questionnaire_data in self.data:
            print questionnaire_data
            questionnaire = Questionnaire.objects.create(name=questionnaire_data.get('name'))
            for question_data in questionnaire_data.get('questions'):
                print question_data
                question = Question.objects.create(text=question_data.get('text'), questionnaire_id=questionnaire.id)
                for choice_data in question_data.get('choices'):
                    print choice_data
                    finish = None
                    if choice_data.get('finish'):
                        finish = QuestionnaireFinishText.objects.create(text = choice_data.get('finish'))
                    choice = Choice.objects.create(text=choice_data.get('text'), question_id=question.id, finish=finish)

  