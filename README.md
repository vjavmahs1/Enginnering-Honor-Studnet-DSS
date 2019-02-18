# eh-DSS
DSS for Engineering Honors


Install needed packages and create virtual env
>pipenv install

Activate virtual env
>pipenv shell

Create db migrations then create db off that schema
>python manage.py makemigrations\
python manage.py migrate

Load the seed data
>python manage.py loaddata seed

Get out of virtual env
>exit
