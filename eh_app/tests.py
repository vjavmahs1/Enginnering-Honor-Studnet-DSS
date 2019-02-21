from django.test import TestCase
from eh_app.models import Course, Department, Section, Semester, Student, StudentSectionEnrollment, TrackRequirements

class SemesterTestCase(TestCase):
    fixtures = ['test_seed']

    def test_current_semester_queryset(self):
        sem = Semester.objects.get_current_semester()
        self.assertEqual(sem.semester, 'Spring')
        self.assertEqual(sem.academic_year, '2018-2019')
        self.assertEqual(sem.current_semester(), True)
        self.assertEqual(sem.past_semester(), False)

    def test_past_semester(self):
        sem = Semester.objects.get(id=201831)
        self.assertEqual(sem.past_semester(), True)
        self.assertEqual(sem.current_semester(), False)

class StudentSectionEnrollmentTestCase(TestCase):
    fixtures = ['test_seed']

    def test_semester(self):
        student_enrollment = StudentSectionEnrollment.objects.get(id=1)
        self.assertEqual(student_enrollment.semester().semester, 'Spring')

    def test_credits(self):
        student_enrollment = StudentSectionEnrollment.objects.get(id=1)
        self.assertEqual(student_enrollment.credits(), 3)
