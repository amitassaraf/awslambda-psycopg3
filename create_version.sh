docker build -f Dockerfile --platform linux/amd64 . -t amitassaraf/psycopg-lambda  --build-arg python_ver=$1
docker create --platform linux/amd64 --name psycopglayer amitassaraf/psycopg-lambda
PY_EXT=$(echo $1 | tr . _)
rm -rf psycopg_$PY_EXT
mkdir -p psycopg_$PY_EXT
docker cp psycopglayer:/opt/psycopg/. psycopg_$PY_EXT/
docker rm -f psycopglayer

