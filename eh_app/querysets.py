from django.db import models
from .custom_signals import new_current_semester

class GPAStatusQueryset(models.QuerySet):
    def get_status(self, code, gpa):
        status_elems = self.filter(code=code, gpa__lte=gpa).order_by('gpa')

        if len(status_elems):
            return status_elems.last()
        else:
            raise ValueError('Provided gpa or code is not valid')

class SemesterQueryset(models.QuerySet):
    def current(self):
        return self.filter(current=True)

    def new_current(self, *args, **kwargs):
        new_current, _ = self.get_or_create(*args, **kwargs)

        current = self.get_current()
        current.successor = new_current
        current.current = False
        current.save()

        new_current.current = True
        new_current.save()

        new_current_semester.send_robust(sender=self.model, new_current_sem=new_current)

        return new_current

    def get_current(self):
        return self.current().get()

class StudentSectionEnrollmentQueryset(models.QuerySet):
    def current(self, *args, **kwargs):
        return self.filter(section__semester__current=True, *args, **kwargs)
