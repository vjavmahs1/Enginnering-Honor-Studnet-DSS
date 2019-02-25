from django.dispatch import Signal

# Custom signals
new_current_semester = Signal(providing_args=['new_current_sem'])
