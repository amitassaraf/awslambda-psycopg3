docker build -f Dockerfile --platform linux/amd64 . -t amitassaraf/psycopg-lambda  --build-arg python_ver=$1
docker create --platform linux/amd64 --name psycopglayer amitassaraf/psycopg-lambda
rm -rf lib
mkdir -p lib
docker cp psycopglayer:/opt/psycopg/psycopg .
# Copy all the needed library files

docker cp -a psycopglayer:/usr/lib/x86_64-linux-gnu/. lib/

PY_EXT=$(echo $1 | tr . _)
mv psycopg psycopg_$PY_EXT
docker rm -f psycopglayer

