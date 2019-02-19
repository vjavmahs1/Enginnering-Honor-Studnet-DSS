# eh-DSS
DSS for Engineering Honors


Install needed packages and create virtual env.
>pipenv install

Activate virtual env.
>pipenv shell

Create db migrations then create db off that schema.
>python manage.py makemigrations\
python manage.py migrate

Test. Creates test db from migration and deletes said db after testing. Additional argument will show code coverage. Testing is limited to NOSE_ARGS in eh_site/settings.py
>python manage.py test (--with-coverage)

Load the seed data.
>python manage.py loaddata seed

Get out of virtual env.
>exit
