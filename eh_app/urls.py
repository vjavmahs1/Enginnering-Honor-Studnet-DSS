from django.urls import path
from . import views

urlpatterns = [
    path('', views.index),
    path('students', views.studentList, name='student_list'),
]
