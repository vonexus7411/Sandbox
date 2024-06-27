from pyspark.sql import SparkSession

# Create a Spark session
spark = (SparkSession.builder
    .appName("my_spark_session")
    .getOrCreate()
)

# Verify the Spark session
spark

# Stop the Spark session when done
spark.stop()