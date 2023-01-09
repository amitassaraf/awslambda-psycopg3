ARG python_ver
FROM python:$python_ver

WORKDIR /opt/psycopg
RUN pip install psycopg[binary] -t .