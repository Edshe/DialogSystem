# -*- coding: utf-8 -*-
from rest_framework import serializers

from .models import Questionnaire, Question, Choice, QuestionnaireFinishText


class QuestionnaireSerializer(serializers.ModelSerializer):
    first_question_id = serializers.ReadOnlyField()
    class Meta:
        model = Questionnaire
        fields = '__all__'


class QuestionnaireFinishTextSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionnaireFinishText
        fields = '__all__'


class ChoiceSerializer(serializers.ModelSerializer):
    finish = QuestionnaireFinishTextSerializer()
    class Meta:
        model = Choice
        fields = '__all__'


class QuestionSerializer(serializers.ModelSerializer):
    choices = ChoiceSerializer(many=True)
    class Meta:
        model = Question
        fields = '__all__'