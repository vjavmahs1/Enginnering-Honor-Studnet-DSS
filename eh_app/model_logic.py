class StudentLogic:
    def status_f_gpa(self):
        pass

    # Maybe do standing logic etc. on pull, then it will update on save

class StudentSectionEnrollmentLogic:
    def semester(self):
        return self.section.semester

    def credits(self):
        return self.section.course.credits
