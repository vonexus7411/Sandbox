# Use base image with Python and Apache Spark pre-installed
FROM python:3.9-slim


# Build container as root
USER root


# Install Hadoop and Java
RUN apt-get update
RUN apt-get install -y curl openjdk-17-jdk
#RUN curl -O https://downloads.apache.org/hadoop/common/current/hadoop-3.4.0.tar.gz
COPY bin/hadoop-3.4.0.tar.gz hadoop-3.4.0.tar.gz
RUN tar -xvzf hadoop-3.4.0.tar.gz
RUN mv hadoop-3.4.0 /usr/local/hadoop
ENV HADOOP_HOME /usr/local/hadoop
ENV JAVA_HOME /usr/lib/jvm/java-17-openjdk-arm64
ENV PATH $JAVA_HOME/bin:$HADOOP_HOME/bin:$PATH

# Install Spark, Jupyter, etc.py
RUN pip install -r requirements.txt
EXPOSE 8888
ENV PYSPARK_PYTHON=python
ENV PYSPARK_DRIVER_PYTHON=python

# Copy the main.py file into the container and run as user
COPY src/ /app/
WORKDIR /app

RUN adduser -u 5678 --disabled-password --gecos "" appuser 
RUN chown -R appuser /app
USER appuser

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

CMD ["python", "main.py"]