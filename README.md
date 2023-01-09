# psycopg 3 Python Library for AWS Lambda
This is a custom compiled psycopg2 C library for Python. Due to AWS Lambda missing the required PostgreSQL libraries in the AMI image, we needed to compile psycopg3 with the PostgreSQL libpq.so library statically linked libpq library instead of the default dynamic link.

## Python 3.X
Just copy the psycopg_binary_3_X directory into your AWS Lambda project and rename it to psycopg_binary before creating your AWS Lambda zip package.
