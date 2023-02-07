docker build -f Dockerfile --platform linux/amd64 . -t amitassaraf/psycopg-lambda  --build-arg python_ver=$1
docker build -f DockerfileC --platform linux/amd64 . -t amitassaraf/psycopg-c-lambda  --build-arg python_ver=$1
docker create --platform linux/amd64 --name psycopglayer amitassaraf/psycopg-lambda
docker create --platform linux/amd64 --name psycopglayer_c amitassaraf/psycopg-c-lambda
docker cp psycopglayer:/opt/psycopg/psycopg_binary .
docker cp psycopglayer_c:/opt/psycopg/psycopg_c .
PY_EXT=$(echo $1 | tr . _)
mv psycopg_binary psycopg_binary_$PY_EXT
mv psycopg_c psycopg_c_$PY_EXT
docker rm -f psycopglayer
docker rm -f psycopglayer_c

