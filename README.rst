Simply dialog system
=======================


Meta
----

Author:
    E.Shemakhov

Status:
    in development

Django Version:
    1.11.18

Python Version:
    2.7


Usage
-----

install:
	python
	redis
	celery
	mysqldb
	rest_framework



About
-----

This program is a simple questionnaire system.

User can choice a questionnaire from a list.
System will load a first question. After user answer the question system
saves user's answer and loads the next question.

After all questions answered system prints full dialog to browser console.



Apps
-------------

Questionnaires:
	
	Main questionnaire models: Questionnaire, Question, Choice.
	Provides API for getting Questionnaires list, Questionnaire details, Question details

	Contains task for creating Questionnaires from json file.
	"data.json" - file example is in project folder. 

Users:
	
	Models: User
	Provides views for authorization and home page view.



Dialogs:
	
	Models: Dialog, UserAnswer
	Provides API for getting Dialogs list, Dialog details
	and API to create new UserAnswer



