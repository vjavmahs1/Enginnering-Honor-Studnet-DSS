from django.db import models

class SemesterQueryset(models.QuerySet):

    def current_semester(self):
        return self.filter(current=True)

    def new_current_semester(self, *args, **kwargs):
        new_current, _ = self.get_or_create(*args, **kwargs)

        current = self.get_current_semester()
        current.successor = new_current
        current.current = False
        current.save()

        new_current.current = True
        new_current.save()

        return new_current

    def get_current_semester(self):
        return self.current_semester().get()
