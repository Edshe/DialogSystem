Simply dialog system
=======================


Author:
    E.Shemakhov

Status:
    in development




About:
-----

This program is a simple questionnaire system.

User can choice a questionnaire from a list. System will load a first question. After user 
answer the question system saves user's answer and loads the next question. 
After all questions answered system prints full dialog to browser console.




Requirements:
-----

- 	Django==1.11.18
-	celery==4.2.1
-	redis==3.0.1
-	djangorestframework==3.9.0





How to install:
-----

Make sure that ```python 2.7```, ```virtualenv```, ```pip``` installed and updated.
Also install ```virtualenvwrapper``` through pip.



**Clone the source of the project**

```
git clone https://github.com/Edshe/dialogtest
```

**Install dependencies**

```
cd dialogtest
mkvirtualenv dialogtest
workon dialogtest
pip install -r requirements.txt
```

**Launch**

```
python manage.py runserver
```

**Run tests**

```
python manage.py test
```





Apps:
-------------

**Questionnaires**:
	
Main questionnaire models: **Questionnaire**, **Question**, **Choice**.
Provides API for getting Questionnaires list, Questionnaire details, Question details Contains task for creating Questionnaires from json file. "data.json" - file example is in project folder. 

**Users**:
	
Models: **User**
Provides views for authorization and home page view.


**Dialogs**:
	
Models: **Dialog**, **UserAnswer**
Provides API for getting Dialogs list, Dialog details
and API to create new UserAnswer



Front-end:
-------------

Django-templates + vue.js


