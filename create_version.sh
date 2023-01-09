docker build --platform linux/amd64 . -t amitassaraf/psycopg-lambda  --build-arg python_ver=$1
docker create --platform linux/amd64 --name psycopglayer amitassaraf/psycopg-lambda
docker cp psycopglayer:/opt/psycopg/psycopg_binary .
PY_EXT=$(echo $1 | tr . _)
mv psycopg_binary psycopg_binary_$PY_EXT
docker rm -f psycopglayer

