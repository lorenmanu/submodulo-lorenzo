from django import forms
from .models import Tienda, Zona, UserProfile
from django.contrib.auth.models import User

class ZonaForm(forms.ModelForm):
    nombre = forms.CharField(max_length=128, help_text="Please enter the category name.")
    localizacion = forms.CharField(max_length=128)
    views = forms.IntegerField(widget=forms.HiddenInput(), initial=0)
    slug = forms.CharField(widget=forms.HiddenInput(), required=False)

    # An inline class to provide additional information on the form.
    class Meta:
        # Provide an association between the ModelForm and a model
        model = Zona


class TiendaForm(forms.ModelForm):
    nombre = forms.CharField(max_length=128, help_text="Please enter the category name.")
    calle = forms.CharField(max_length=128)

    class Meta:
        # Provide an association between the ModelForm and a model
        model = Tienda


class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('username', 'email', 'password')

class UserProfileForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ('website', 'picture')