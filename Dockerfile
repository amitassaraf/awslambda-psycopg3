FROM python:3.9

WORKDIR /opt/psycopg
RUN pip install psycopg[binary] -t .