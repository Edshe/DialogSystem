from django.db.models import fields

class EmailField(fields.EmailField):

    def __init__(self, *args, **kwargs):
        self.case_insensitive = kwargs.pop('case_insensitive', True)
        super(EmailField, self).__init__(*args, **kwargs)