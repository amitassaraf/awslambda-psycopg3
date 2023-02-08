docker build -f Dockerfile --platform linux/amd64 . -t amitassaraf/psycopg-lambda  --build-arg python_ver=$1
docker build -f DockerfileC --platform linux/amd64 . -t amitassaraf/psycopg-c-lambda  --build-arg python_ver=$1
docker create --platform linux/amd64 --name psycopglayer amitassaraf/psycopg-lambda
docker create --platform linux/amd64 --name psycopglayer_c amitassaraf/psycopg-c-lambda
docker cp psycopglayer:/opt/psycopg/psycopg_binary .
docker cp psycopglayer_c:/opt/psycopg/psycopg_c .
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libpq.so.5 psycopg_binary/libpq.so.5
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libpq.so psycopg_binary/libpq.so
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libpq.so.5.13 psycopg_binary/libpq.so.5.13
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.a psycopg_binary/libssl.a
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.so psycopg_binary/libssl.so
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.so.1.1 psycopg_binary/libssl.so.1.1
docker cp psycopglayer_c:/usr/lib/x86_64-linux-gnu/libpq.so.5 psycopg_c/libpq.so.5
docker cp psycopglayer_c:/usr/lib/x86_64-linux-gnu/libpq.so psycopg_c/libpq.so
docker cp psycopglayer_c:/usr/lib/x86_64-linux-gnu/libpq.so.5.13 psycopg_c/libpq.so.5.13
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.a psycopg_c/libssl.a
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.so psycopg_c/libssl.so
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.so.1.1 psycopg_c/libssl.so.1.1
PY_EXT=$(echo $1 | tr . _)
mv psycopg_binary psycopg_binary_$PY_EXT
mv psycopg_c psycopg_c_$PY_EXT
docker rm -f psycopglayer
docker rm -f psycopglayer_c

