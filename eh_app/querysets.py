from django.db import models

class SemesterQueryset(models.QuerySet):
    def current_semester(self):
        return self.filter(successor__isnull=True, predecessor__isnull=False)

    def get_current_semester(self):
        return self.current_semester().get()
