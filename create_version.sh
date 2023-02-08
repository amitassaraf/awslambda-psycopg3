docker build -f Dockerfile --platform linux/amd64 . -t amitassaraf/psycopg-lambda  --build-arg python_ver=$1
docker create --platform linux/amd64 --name psycopglayer amitassaraf/psycopg-lambda
rm -rf lib
mkdir -p lib
docker cp psycopglayer:/opt/psycopg/psycopg .
# Copy all the needed library files

docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libpq.a lib/libpq.a
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libpq.so.5 lib/libpq.so.5
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libpq.so lib/libpq.so
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libpq.so.5.13 lib/libpq.so.5.13
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.a lib/libssl.a
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.so lib/libssl.so
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libssl.so.1.1 lib/libssl.so.1.1
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libcrypt.a lib/libcrypt.a
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libcrypt.so lib/libcrypt.so
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libcrypto.a lib/libcrypto.a
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libcrypto.so lib/libcrypto.so
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 lib/libcrypto.so.1.1
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libldap-2.4.so.2 lib/libldap-2.4.so.2
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libldap_r-2.4.so.2 lib/libldap_r-2.4.so.2
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/libldap_r-2.4.so.2.11.5 lib/libldap_r-2.4.so.2.11.5
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/liblber-2.4.so.2.11.5 lib/liblber-2.4.so.2.11.5
docker cp psycopglayer:/usr/lib/x86_64-linux-gnu/liblber-2.4.so.2 lib/liblber-2.4.so.2

PY_EXT=$(echo $1 | tr . _)
mv psycopg psycopg_$PY_EXT
docker rm -f psycopglayer

