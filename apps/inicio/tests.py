"""
This file demonstrates writing tests using the unittest module. These will pass
when you run "manage.py test".

Replace this with more appropriate tests for your application.
"""

import datetime

from django.utils import timezone
from django.test import TestCase

from models import Perfiles

class RutasTests(APITestCase):

    def producto(self):
        q1 = Perfiles(usuario='Lorenzo',telefono='653057946')
        q1.save()
        self.assertEqual(response.content,'{"usuario":"Lorenzo","telefono":"653057946"}')
        
        print("Question consultada XD2")

  
