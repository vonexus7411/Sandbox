from pyspark.sql import SparkSession

# Create a Spark session
spark = (SparkSession.builder
    .appName("my_spark_session")
    .getOrCreate()
)

spark

spark.stop()