# -*- coding: utf-8 -*-
from rest_framework import serializers

from ..models import Questionnaire, Question, Choice, QuestionnaireFinishText



class QuestionnaireFinishTextSerializer(serializers.ModelSerializer):
    class Meta:
        model = QuestionnaireFinishText
        fields = '__all__'

    def create(self, validated_data):
        # Checking if current text record already in base
        # Currently used only by json_parser task.
        try:
            instance = self.Meta.model.objects.get(text = validated_data.get('text'))
            return instance
        except QuestionnaireFinishText.DoesNotExist:
            return super(QuestionnaireFinishTextSerializer, self).create(validated_data)




class ChoiceSerializer(serializers.ModelSerializer):
    finish = QuestionnaireFinishTextSerializer(read_only=True)
    class Meta:
        model = Choice
        fields = '__all__'


class QuestionSerializer(serializers.ModelSerializer):
    choices = ChoiceSerializer(many=True, read_only=True)
    class Meta:
        model = Question
        fields = '__all__'


class QuestionnaireSerializer(serializers.ModelSerializer):
    first_question_id = serializers.ReadOnlyField()
    class Meta:
        model = Questionnaire
        fields = '__all__'




