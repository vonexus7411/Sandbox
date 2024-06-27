#!/usr/bin/env sh
docker build -t my-pyspark-app .
docker run my-pyspark-app
#docker run -p 8888:8888 my-pyspark-app