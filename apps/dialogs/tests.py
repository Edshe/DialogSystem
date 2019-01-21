# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.urlresolvers import reverse
from django.test import TestCase

from .models import Dialog
from ..users.models import User
from ..questionnaires.models import Questionnaire, Question, Choice



class DialogApiTest(TestCase):

    def setUp(self):
        self.user = User.objects.create_user(email = "dialog@test.com", password='12345')
        self.questionnaire = Questionnaire.objects.create(name="test")
        self.data = dict(
            questionnaire = self.questionnaire.id
        )

    def test_create_dialog_without_login(self):
        """ Method checks is it possible to create a new dialog """
        response = self.client.post(reverse('dialogs-api:dialogs'), self.data)
        self.assertEqual(response.status_code, 201)
        self.assertNotEqual(len(response.data), 0)
        self.assertEqual(response.data.get('user'), None)

    def test_create_dialog_with_login(self):
        """ Method checks is it possible to create a new dialog if user authenticated """
        auth = self.client.login(email = "dialog@test.com", password='12345')
        self.assertEqual(auth, True)
        response = self.client.post(reverse('dialogs-api:dialogs'), self.data)
        self.assertEqual(response.status_code, 201)
        self.assertNotEqual(len(response.data), 0)
        self.assertEqual(response.data.get('user'), self.user.id)




class UserAnswerApiTest(TestCase):

    def setUp(self):
        self.questionnaire = Questionnaire.objects.create(name="test")
        self.question = Question.objects.create(text="question", questionnaire_id = self.questionnaire.id)
        self.choice = Choice.objects.create(text="choice", question_id=self.question.id)
        self.dialog = Dialog.objects.create(questionnaire_id = self.questionnaire.id)

    def test_create_user_answer(self):
        """ Method sends dialog id and choice id to API to create a new UserAnswer """
        data = dict(
            dialog=self.dialog.id,
            choice=self.choice.id,
        )

        response = self.client.post(reverse('dialogs-api:useranswers'), data)
        self.assertEqual(response.status_code, 201)
        self.assertNotEqual(len(response.data), 0)
        self.assertEqual(response.data.get('dialog'), self.dialog.id)