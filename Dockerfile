ARG python_ver
FROM python:$python_ver

WORKDIR /opt/psycopg
RUN apt-get update && apt-get install -y libpq5
RUN pip install psycopg -t .