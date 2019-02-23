from django.test import TestCase
from eh_app.models import GPAStatus, Semester, StudentSectionEnrollment, StudentSemesterStatus

class GPAStatusTestCase(TestCase):
    fixtures = ['GPADeficiency']

    def test_get_status_queryset(self):
        status = GPAStatus.objects.get_status('D1', 2.6)
        self.assertEqual(status.status, 'Stay on Grace Period-GPA Def')

        status = GPAStatus.objects.get_status('D4', 3.8)
        self.assertEqual(status.status, 'Good Standing(Prev Prob)')

        self.assertRaises(
            ValueError,
            GPAStatus.objects.get_status,
            'D4',
            -1,
        )

        self.assertRaises(
            ValueError,
            GPAStatus.objects.get_status,
            'D10',
            1,
        )

class SemesterTestCase(TestCase):
    fixtures = ['test_seed']

    def test_current_queryset(self):
        sem = Semester.objects.get_current()
        self.assertEqual(sem.semester, 'Spring')
        self.assertEqual(sem.academic_year, '2018-2019')
        self.assertEqual(sem.current_semester(), True)
        self.assertEqual(sem.past_semester(), False)

    def test_new_current(self):
        # Where a semester is created newly
        Semester.objects.new_current(id=201921)
        self.assertEqual(Semester.objects.get_current().id, 201921)
        self.assertEqual(Semester.objects.get_current().predecessor.id, 201911)

        # Existing semester is found
        Semester.objects.new_current(id=202211)
        self.assertEqual(Semester.objects.get_current().id, 202211)
        self.assertEqual(Semester.objects.get_current().predecessor.id, 201921)

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

class StudentSemesterStatusTestCase(TestCase):
    fixtures = ['test_seed']

    def test_post_init(self):
        status = StudentSemesterStatus.objects.get(id=1)
        self.assertEqual(status.overall_hours_attempted, 0)
        self.assertEqual(status.status, 'Good Standing')
        self.assertEqual(status.previous_status, 'Good Standing')

        status = StudentSemesterStatus.objects.get(id=2)
        self.assertEqual(status.hours_attempted, 3)
        self.assertEqual(status.previous_status, 'Good Standing')
        self.assertEqual(status.overall_hours_attempted, 3)
        self.assertEqual(status.overall_quality_points, 12)
