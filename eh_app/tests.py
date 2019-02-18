from django.test import TestCase
from eh_app.models import TrackRequirements

# Create your tests here.
class TrackRequirementsTestCase(TestCase):
    def setUp(self):
        TrackRequirements.objects.create(id=1, per_sem=1, description='This is a test description')

    def test_per_year(self):
        track_req = TrackRequirements.objects.get(id=1)
        self.assertEqual(track_req.per_year(), 2)
