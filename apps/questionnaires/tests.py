# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.urlresolvers import reverse
from django.test import TestCase

from .models import Questionnaire, Question


class QuestionnairesBaseCase(TestCase):
    """ Base TestCase class that declare setUp method"""
    def setUp(self):
        self.questionnaire = Questionnaire.objects.create(name='Test')


class QuestionnaireApiTest(QuestionnairesBaseCase):
    def test_get_questionnaire_list_request(self):
        """ Method gets questionnaires list through api """
        response = self.client.get(reverse('questionnaires-api:questionnaires'))
        self.assertEqual(response.status_code, 200)
        self.assertNotEqual(len(response.data), 0)


class QuestionApiTest(QuestionnairesBaseCase):
    def setUp(self):
        super(QuestionApiTest, self).setUp()
        self.question = Question.objects.create(
            text='Test', questionnaire_id = self.questionnaire.id
        )
    def test_get_questionnaire_list_request(self):
        """ Method gets question details through api """
        response = self.client.get(reverse('questionnaires-api:question', kwargs={'pk':self.question.id}))
        self.assertEqual(response.status_code, 200)
        self.assertNotEqual(len(response.data), 0)