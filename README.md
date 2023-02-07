# psycopg 3 Python Library for AWS Lambda
This is a custom compiled psycopg3 C library for Python. Due to Lambdas running on Linux and most working machines are on MacOS we prebuild the binary.

## Python 3.X
Just copy the psycopg_binary_3_X directory into your AWS Lambda project and rename it to psycopg_binary before creating your AWS Lambda zip package.
