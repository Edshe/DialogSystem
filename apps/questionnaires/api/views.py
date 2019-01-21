# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.generics import get_object_or_404

from ..models import Questionnaire, Question
from .serializers import QuestionnaireSerializer, QuestionSerializer


class QuestionnaireList(APIView):
    """
    List all questionnaires
    """
    def get(self, request, format=None):
        questionnaires = Questionnaire.objects.all()
        serializer = QuestionnaireSerializer(questionnaires, many=True)
        return Response(serializer.data)


class QuestionDetail(APIView):
    """
    Retrieve question
    """
    def get(self, request, pk, format=None):
        question = get_object_or_404(Question, pk = pk)
        serializer = QuestionSerializer(question)
        return Response(serializer.data)
