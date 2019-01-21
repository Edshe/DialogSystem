# -*- coding: utf-8 -*-
from rest_framework import serializers

from ..models import Dialog, UserAnswer



class UserAnswerSerializer(serializers.ModelSerializer):
    question = serializers.StringRelatedField()
    class Meta:
        model = UserAnswer
        fields = '__all__'



class DialogSerializer(serializers.ModelSerializer):
    useranswers = UserAnswerSerializer(read_only=True)
    to_str = serializers.ReadOnlyField()
    class Meta:
        model = Dialog
        fields = '__all__'

