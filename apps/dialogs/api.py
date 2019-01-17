# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from rest_framework.generics import get_object_or_404
from django.views.decorators.csrf import csrf_exempt

from .models import Dialog, UserAnswer
from .serializers import DialogSerializer, UserAnswerSerializer


class DialogsList(APIView):
    """
    List all Dialogs or create it
    """
    @csrf_exempt
    def get(self, request, format=None):
        dialogs = Dialog.objects.all()
        serializer = DialogSerializer(dialogs, many=True)
        return Response(serializer.data)

    @csrf_exempt
    def post(self, request, format=None):
        serializer = DialogSerializer(data=request.data)
        if serializer.is_valid():
            if request.user.is_authenticated():
                serializer.save(user =  request.user)
            else:
                serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class DialogDetail(APIView):
    """
    Receive Dialog
    """
    @csrf_exempt
    def get(self, request, pk, format=None):
        dialog = get_object_or_404(Dialog, pk=pk)
        serializer = DialogSerializer(dialog)
        serializer.data['repr'] = repr(dialog)
        return Response(serializer.data)


class UserAnswerCreate(APIView):
    """
    Create new Users answers through post.
    Required fields: choice, dialog
    """
    @csrf_exempt
    def post(self, request, format=None):
        serializer = UserAnswerSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
