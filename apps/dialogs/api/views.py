# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import get_object_or_404

from ..models import Dialog
from .serializers import DialogSerializer, UserAnswerSerializer


class DialogsList(APIView):
    """
    List all Dialogs or create it
    """
    def get(self, request, format=None):
        """
        List all dialogs
        """
        if request.user.is_authenticated():
            dialogs = Dialog.objects.filter(user_id = request.user.id)
            serializer = DialogSerializer(dialogs, many=True)
            return Response(serializer.data)
        return Response(status=status.HTTP_401_UNAUTHORIZED)

    def post(self, request, format=None):
        """
        Create a new Dialog
        Required fields: questionnaire(questionnaire_id)
        return: serialized Dialog
        """
        serializer = DialogSerializer(data=request.data)
        if serializer.is_valid():
            if request.user.is_authenticated():
                serializer.save(user = request.user)
            else:
                serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DialogDetail(APIView):
    """

    """
    def get(self, request, pk, format=None):
        """
        Retrieve Dialog
        return: serialized Dialog
        """

        dialog = get_object_or_404(Dialog, pk=pk)
        serializer = DialogSerializer(dialog)
        serializer.data['repr'] = repr(dialog)
        return Response(serializer.data)



class UserAnswerCreate(APIView):
    """
    Create a new UsersAnswer through post request.
    """
    def post(self, request, format=None):
        """
        Required fields: choice(choice_id), dialog(dialog_id)
        return: serialized UserAnswer
        """
        serializer = UserAnswerSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
