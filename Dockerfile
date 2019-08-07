FROM python:3.7
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY . /app

CMD [ "gunicorn", "--chdir", "base", "--bind", ":8080", "base.wsgi:application"]