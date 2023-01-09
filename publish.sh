docker build --platform linux/amd64 . -t amitassaraf/psycopg-lambda
docker create --platform linux/amd64 --name psycopglayer amitassaraf/psycopg-lambda
docker cp psycopglayer:/opt/psycopg/psycopg_binary .
docker rm -f psycopglayer

