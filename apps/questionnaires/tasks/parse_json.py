# -*- coding: utf-8 -*-

from __future__ import absolute_import, unicode_literals


import os
import logging
import ast
from celery import shared_task

from django.db import transaction
from django.conf import settings

from ..api.serializers import QuestionnaireSerializer, QuestionSerializer, ChoiceSerializer, QuestionnaireFinishTextSerializer

logging.basicConfig(filename="JsonParser.log", level=logging.INFO)


SERIALIZERS = {
    'Questionnaire' : QuestionnaireSerializer,
    'Question' : QuestionSerializer,
    'Choice' : ChoiceSerializer,
    'QuestionnaireFinishText' : QuestionnaireFinishTextSerializer,
}

# The file in the project folder
FILENAME = 'data.json'


@shared_task
def parse_json():
    Handle().run()


class Handle:
    data = []

    def run(self):
        self._get_source()
        self._parse_objects(self.data)

    def _get_source(self):
        logging.info('---- Reading file')
        f = open(os.path.join(settings.BASE_DIR, FILENAME), 'r')
        to_json = ast.literal_eval(f.read())
        logging.info('- Done')
        self.data = to_json


    def _parse_objects(self, data, **kwargs):
        """
        Method for parse json data with EAV structure.
        Method expeсts that every data element contains:
        model: determine Model of current object,
        fields: fields for serializator,
        and related elements list if exists.
        """
        for _obj in data:

            # Checking if current _obj has a fields which are related objects
            # if so - replacing field value with the related object id.
            for key, value in _obj.get('fields', {}).items():
                if isinstance(value, dict) and value.get('model'):
                    related_model_name = value.get('model')
                    _created_related = self._create_object(data=value.get('fields'), model_name=related_model_name)
                    _obj.get('fields')[key] = _created_related.id

            # Creating object through Serializer
            model_name = _obj.get('model')
            _obj.get('fields').update(kwargs)
            _created = self._create_object(
                data = _obj.get('fields'), # Adding *_pk field from kwargs if exists
                model_name = model_name
                )

            # Checking if current _obj has a list of related
            # elements, recursively calling _parse_objects()
            # to create related elements
            if _created:
                for key,value in _obj.items():
                    if isinstance(value, list):
                        additional_args = {
                            model_name.lower() : _created.id # Sending *_pk field to related elements
                            }
                        self._parse_objects(value, **additional_args)


    def _create_object(self, data=None, model_name=None):
        logging.info('---- Serializing object: {}'.format(model_name))
        logging.info(str(data))
        serializer_class = SERIALIZERS.get(model_name)
        serializer = serializer_class(data=data)
        if serializer.is_valid():
            serializer.save()
            logging.info('- Object created')
            return serializer.instance
        logging.error('- Validating error')
        logging.error(str(serializer.errors))
        return False








