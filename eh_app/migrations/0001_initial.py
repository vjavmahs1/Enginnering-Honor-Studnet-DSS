# Generated by Django 2.1.7 on 2019-02-25 00:23

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('date', models.DateField(default=None, null=True)),
                ('location', models.CharField(default=None, max_length=45, null=True)),
                ('details', models.TextField(default=None, max_length=255, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Advisor',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('uin', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(default=None, max_length=45, null=True)),
                ('last_name', models.CharField(default=None, max_length=45, null=True)),
                ('middle_name', models.CharField(default=None, max_length=45, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Campus',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('name', models.CharField(max_length=45, primary_key=True, serialize=False)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='College',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('name', models.CharField(max_length=2, primary_key=True, serialize=False)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Course',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('number', models.PositiveIntegerField()),
                ('title', models.CharField(default=None, max_length=45, null=True)),
                ('credits', models.PositiveIntegerField()),
                ('min_credits', models.PositiveIntegerField(default=None, null=True)),
                ('max_credits', models.PositiveIntegerField(default=None, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Degree',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('name', models.CharField(max_length=4, primary_key=True, serialize=False)),
                ('concentration', models.CharField(default=None, max_length=16, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Department',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('name', models.CharField(max_length=7, primary_key=True, serialize=False)),
                ('activities_per_semester', models.DecimalField(decimal_places=1, max_digits=2)),
                ('advising_per_semester', models.DecimalField(decimal_places=1, max_digits=2)),
                ('activities', models.ManyToManyField(default=None, to='eh_app.Activity')),
                ('advisors', models.ManyToManyField(default=None, to='eh_app.Advisor')),
                ('college', models.ForeignKey(on_delete=None, to='eh_app.College')),
                ('required_activities', models.ManyToManyField(default=None, related_name='required_activities_set', to='eh_app.Activity')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='GPADeficiency',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('value', models.CharField(max_length=45, primary_key=True, serialize=False)),
                ('code', models.CharField(max_length=2)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='GPAStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('code', models.CharField(max_length=2)),
                ('gpa', models.DecimalField(decimal_places=2, max_digits=3)),
                ('status', models.CharField(max_length=45)),
            ],
        ),
        migrations.CreateModel(
            name='Requirement',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('code', models.CharField(max_length=15)),
                ('description', models.TextField(default=None, max_length=255, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Research',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('program', models.CharField(default=None, max_length=50, null=True)),
                ('details', models.TextField(default=None, max_length=255, null=True)),
                ('advisor', models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Advisor')),
                ('department', models.ForeignKey(on_delete=None, to='eh_app.Department')),
                ('requirement_satisfied', models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Requirement')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Section',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('crn', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('number', models.PositiveIntegerField(default=None, null=True)),
                ('level', models.CharField(choices=[('L', 'Lower'), ('U', 'Upper')], max_length=1)),
                ('campus', models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Campus')),
                ('course', models.ForeignKey(on_delete=None, to='eh_app.Course')),
            ],
        ),
        migrations.CreateModel(
            name='Semester',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('id', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('semester', models.CharField(default=None, max_length=16, null=True)),
                ('academic_year', models.CharField(default=None, max_length=9, null=True)),
                ('current', models.BooleanField(default=False)),
                ('successor', models.OneToOneField(default=None, null=True, on_delete=None, related_name='predecessor', to='eh_app.Semester')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('uin', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(default=None, max_length=45, null=True)),
                ('last_name', models.CharField(default=None, max_length=45, null=True)),
                ('middle_name', models.CharField(default=None, max_length=45, null=True)),
                ('email', models.EmailField(default=None, max_length=45, null=True)),
                ('times_on_probation', models.PositiveIntegerField(default=0)),
                ('times_dismissed', models.PositiveIntegerField(default=0)),
                ('degree_candidate', models.BooleanField(default=False)),
                ('graduated', models.BooleanField(default=False)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='StudentAdvisorMeeting',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('date', models.DateField(default=None, null=True)),
                ('details', models.TextField(default=None, max_length=255, null=True)),
                ('advisor', models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Advisor')),
                ('requirement_satisfied', models.ForeignKey(on_delete=None, to='eh_app.Requirement')),
                ('semester', models.ForeignKey(on_delete=None, to='eh_app.Semester')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='StudentResearch',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('course_credit', models.PositiveIntegerField(default=None, null=True)),
                ('paper_published', models.CharField(default=None, max_length=2, null=True)),
                ('conference_attended', models.CharField(default=None, max_length=2, null=True)),
                ('presentation', models.CharField(default=None, max_length=2, null=True)),
                ('details', models.TextField(default=None, max_length=255, null=True)),
                ('research', models.ForeignKey(on_delete=None, to='eh_app.Research')),
                ('semester', models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Semester')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='StudentSectionEnrollment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('grade', models.CharField(default=None, max_length=2, null=True)),
                ('grading_mode', models.CharField(default=None, max_length=10, null=True)),
                ('repeat', models.CharField(default=None, max_length=10, null=True)),
                ('section', models.ForeignKey(on_delete=None, to='eh_app.Section')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='StudentSemesterStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('hours_attempted', models.PositiveIntegerField()),
                ('hours_earned', models.PositiveIntegerField(default=0)),
                ('hours_passed', models.PositiveIntegerField(default=0)),
                ('quality_points', models.PositiveIntegerField(default=0)),
                ('semester_gpa', models.DecimalField(decimal_places=2, default=0, max_digits=3)),
                ('finalized', models.BooleanField(default=False)),
                ('overall_hours_attempted', models.PositiveIntegerField(default=0)),
                ('overall_hours_earned', models.PositiveIntegerField(default=0)),
                ('overall_hours_passed', models.PositiveIntegerField(default=0)),
                ('overall_quality_points', models.PositiveIntegerField(default=0)),
                ('overall_gpa', models.DecimalField(decimal_places=2, default=0, max_digits=3)),
                ('status', models.CharField(default='n/a', max_length=20)),
                ('previous_status', models.CharField(default='Good Standing', max_length=20)),
                ('predecessor', models.OneToOneField(default=None, null=True, on_delete=None, related_name='successor', to='eh_app.StudentSemesterStatus')),
                ('semester', models.ForeignKey(on_delete=None, to='eh_app.Semester')),
            ],
        ),
        migrations.CreateModel(
            name='StudentTrackEnrollment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('campus', models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Campus')),
                ('semester', models.ForeignKey(on_delete=None, to='eh_app.Semester')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('uin', models.PositiveIntegerField(primary_key=True, serialize=False)),
                ('first_name', models.CharField(default=None, max_length=45, null=True)),
                ('last_name', models.CharField(default=None, max_length=45, null=True)),
                ('middle_name', models.CharField(default=None, max_length=45, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Track',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('id', models.CharField(max_length=15, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=45)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='TrackRequirements',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('per_sem', models.DecimalField(decimal_places=1, max_digits=2)),
                ('description', models.TextField(default=None, max_length=255, null=True)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Exception',
            fields=[
                ('created_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('updated_at', models.DateTimeField(auto_now=True, null=True)),
                ('type_of_leave', models.CharField(default=None, max_length=45, null=True, unique=True)),
                ('leave_duration', models.CharField(default=None, max_length=10, null=True)),
                ('student', models.OneToOneField(on_delete=None, primary_key=True, serialize=False, to='eh_app.Student')),
                ('semester', models.ForeignKey(on_delete=None, to='eh_app.Semester')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.AddField(
            model_name='track',
            name='requirements',
            field=models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.TrackRequirements'),
        ),
        migrations.AddField(
            model_name='track',
            name='semester_started',
            field=models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Semester'),
        ),
        migrations.AddField(
            model_name='studenttrackenrollment',
            name='student',
            field=models.ForeignKey(on_delete=None, to='eh_app.Student'),
        ),
        migrations.AddField(
            model_name='studenttrackenrollment',
            name='track',
            field=models.ForeignKey(on_delete=None, to='eh_app.Track'),
        ),
        migrations.AddField(
            model_name='studentsemesterstatus',
            name='student',
            field=models.ForeignKey(on_delete=None, related_name='semester_statuses_set', to='eh_app.Student'),
        ),
        migrations.AddField(
            model_name='studentsectionenrollment',
            name='student',
            field=models.ForeignKey(on_delete=None, to='eh_app.Student'),
        ),
        migrations.AddField(
            model_name='studentresearch',
            name='student',
            field=models.ForeignKey(on_delete=None, to='eh_app.Student'),
        ),
        migrations.AddField(
            model_name='studentadvisormeeting',
            name='student',
            field=models.ForeignKey(on_delete=None, to='eh_app.Student'),
        ),
        migrations.AddField(
            model_name='student',
            name='activities_attended',
            field=models.ManyToManyField(default=None, to='eh_app.Activity'),
        ),
        migrations.AddField(
            model_name='student',
            name='graduation_semester',
            field=models.ForeignKey(default=None, null=True, on_delete=None, related_name='graduating_set', to='eh_app.Semester'),
        ),
        migrations.AddField(
            model_name='student',
            name='majors',
            field=models.ManyToManyField(default=None, related_name='majors_set', to='eh_app.Degree'),
        ),
        migrations.AddField(
            model_name='student',
            name='minors',
            field=models.ManyToManyField(default=None, related_name='minors_set', to='eh_app.Degree'),
        ),
        migrations.AddField(
            model_name='student',
            name='start_semester',
            field=models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Semester'),
        ),
        migrations.AddField(
            model_name='section',
            name='semester',
            field=models.ForeignKey(on_delete=None, to='eh_app.Semester'),
        ),
        migrations.AddField(
            model_name='section',
            name='teacher',
            field=models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Teacher'),
        ),
        migrations.AlterUniqueTogether(
            name='gpastatus',
            unique_together={('code', 'gpa')},
        ),
        migrations.AddField(
            model_name='department',
            name='track',
            field=models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Track'),
        ),
        migrations.AddField(
            model_name='degree',
            name='department',
            field=models.ForeignKey(on_delete=None, to='eh_app.Department'),
        ),
        migrations.AddField(
            model_name='course',
            name='department',
            field=models.ForeignKey(on_delete=None, to='eh_app.Department'),
        ),
        migrations.AddField(
            model_name='advisor',
            name='track',
            field=models.ForeignKey(default=None, null=True, on_delete=None, to='eh_app.Track'),
        ),
        migrations.AddField(
            model_name='activity',
            name='requirement_satisfied',
            field=models.ForeignKey(on_delete=None, to='eh_app.Requirement'),
        ),
        migrations.AddField(
            model_name='activity',
            name='semester',
            field=models.ForeignKey(on_delete=None, to='eh_app.Semester'),
        ),
        migrations.AlterUniqueTogether(
            name='studentsemesterstatus',
            unique_together={('semester', 'predecessor')},
        ),
        migrations.AlterUniqueTogether(
            name='section',
            unique_together={('crn', 'semester')},
        ),
        migrations.AlterUniqueTogether(
            name='degree',
            unique_together={('department', 'concentration')},
        ),
        migrations.AlterUniqueTogether(
            name='course',
            unique_together={('number', 'title', 'department')},
        ),
    ]
