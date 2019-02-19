from django.test import TestCase
from eh_app.models import Course, Department, Section, Semester, Student, StudentSectionEnrollment, TrackRequirements

class StudentSectionEnrollmentTestCase(TestCase):
    def setUp(self):
        department = Department.objects.create(
            name='CSCE',
            activities_per_semester=1,
            advising_per_semester=1
        )
        course = Course.objects.create(id=1, number=310, credits=3, department=department)
        semester = Semester.objects.create(id=1, semester='Fall', academic_year='2018-2019')
        section = Section.objects.create(
            crn=15029,
            level='L',
            course=course,
            semester=semester
        )

        student = Student.objects.create(uin=123004567)

        StudentSectionEnrollment.objects.create(id=1, section=section, student=student)

    def test_semester(self):
        student_enrollment = StudentSectionEnrollment.objects.get(id=1)
        self.assertEqual(student_enrollment.semester().semester, 'Fall')

    def test_credits(self):
        student_enrollment = StudentSectionEnrollment.objects.get(id=1)
        self.assertEqual(student_enrollment.credits(), 3)
