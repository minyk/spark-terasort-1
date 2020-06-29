FROM openjdk:8-slim-buster

RUN apt update -y && \
    apt install -y wget curl procps vim sudo bc

WORKDIR /opt

USER root

COPY docker/install_spark.sh .
RUN ./install_spark.sh
COPY docker/install_hadoop.sh .
RUN ./install_hadoop.sh
COPY docker/install_gotty.sh .
RUN ./install_gotty.sh
COPY docker/gotty.config /root/.gotty

ENV SPARK_HOME="/opt/spark"
#ENV HADOOP_HOME="/opt/hadoop"
ENV PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin:/opt/hadoop/bin"

COPY target/spark-terasort-1.2-SNAPSHOT-jar-with-dependencies.jar /opt/spark-terasort-1.2-SNAPSHOT-jar-with-dependencies.jar
COPY target/spark-terasort-1.2-SNAPSHOT.jar /opt/spark-terasort-1.2-SNAPSHOT.jar
COPY src/main/resources/* /opt/

ADD https://dl.min.io/client/mc/release/linux-amd64/mc /opt/mc
RUN chmod +x mc && mv mc /usr/bin/mc

ENTRYPOINT ["/usr/bin/gotty", "bash"]
