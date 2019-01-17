# -*- coding: utf-8 -*-
from rest_framework import serializers

from .models import Dialog, UserAnswer
from ..questionnaires.models import Questionnaire


class UserAnswerSerializer(serializers.ModelSerializer):
    question = serializers.ReadOnlyField()
    next_question = serializers.ReadOnlyField()
    class Meta:
        model = UserAnswer
        fields = '__all__'


class DialogSerializer(serializers.ModelSerializer):
    useranswers = UserAnswerSerializer(read_only=True)
    questionnaire = serializers.IntegerField(source='questionnaire_id')
    to_str = serializers.ReadOnlyField()
    class Meta:
        model = Dialog
        fields = '__all__'

