# -*- coding: utf-8 -*-

from django.contrib.auth import authenticate
from django import forms


class AuthenticationForm(forms.Form):
    """
    Base class for authenticating users.
    """
    email = forms.EmailField(
        max_length=254,
    )
    password = forms.CharField(
        max_length=16,
        label="Password",
        widget=forms.PasswordInput
    )

    def clean(self):
        # overriding base method to add user authenticate check
        email = self.cleaned_data.get('email')
        password = self.cleaned_data.get('password')
        self.__user = authenticate(email=email, password=password)
        if not self.__user:
            raise forms.ValidationError(
                {'password': 'Whoops! The password you have entered is incorrect'},
                code = "wrong_password")
        return self.cleaned_data

    def get_user(self):
        return self.__user