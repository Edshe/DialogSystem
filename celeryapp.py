import os
from celery import Celery
from celery.schedules import crontab, schedule
from datetime import timedelta

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'TestBot.settings')

app = Celery(
    'TestBot',
    broker='redis://localhost:6379/0',
    include=['apps.questionnaires.tasks'],
)

app.config_from_object('django.conf:settings', namespace='CELERY')

app.autodiscover_tasks()

app.conf.beat_schedule = {
    # Executes every Monday morning at 7:30 a.m.
    'parse-json': {
        'task': 'apps.questionnaires.tasks.parse_json.parse_json',
        'schedule': schedule(run_every=timedelta(minutes=30)),
    },
}
