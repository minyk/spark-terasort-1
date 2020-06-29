#!/bin/bash
# This script is intended for use from the docker builds.

set -ex

SCALA_VERSION="2.12"
SPARK_VERSION="3.0.0"
SPARK_VERSION_DIR="spark-${SPARK_VERSION}"

SPARK_NAME="spark-${SPARK_VERSION}-bin-hadoop3.2"
#SPARK_NAME="spark-${SPARK_VERSION}-bin-without-hadoop"

pushd /opt
wget "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=spark/${SPARK_VERSION_DIR}/${SPARK_NAME}.tgz" -O ${SPARK_NAME}.tgz && tar zxpf "${SPARK_NAME}.tgz" && mv "${SPARK_NAME}" spark && rm "${SPARK_NAME}.tgz"
popd
