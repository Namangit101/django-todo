FROM python:3
RUN pip install django==3.2
COPY . .
RUN python manage.py migrate
CMD ["python" , "runserver" , "manage.py" , "0.0.0.0:80001"]
