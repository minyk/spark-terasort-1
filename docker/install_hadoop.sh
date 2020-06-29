#!/bin/bash
# This script is intended for use from the docker builds.

set -ex

HADOOP_VERSION="3.2.1"
AWS_SDK_VERSION="1.11.375"
HADOOP_VERSION_DIR="hadoop-${HADOOP_VERSION}"

HADOOP_NAME="hadoop-${HADOOP_VERSION}"

pushd /opt
wget "https://www.apache.org/dyn/mirrors/mirrors.cgi?action=download&filename=hadoop/common/${HADOOP_VERSION_DIR}/${HADOOP_NAME}.tar.gz" -O ${HADOOP_NAME}.tar.gz && tar zxpf "${HADOOP_NAME}.tar.gz" && mv "${HADOOP_NAME}" hadoop && rm "${HADOOP_NAME}.tar.gz"
cp hadoop/share/hadoop/tools/lib/hadoop-aws-${HADOOP_VERSION}.jar hadoop/share/hadoop/common/lib/hadoop-aws-${HADOOP_VERSION}.jar
cp hadoop/share/hadoop/tools/lib/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar hadoop/share/hadoop/common/lib/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar
cp hadoop/share/hadoop/tools/lib/hadoop-aws-${HADOOP_VERSION}.jar spark/jars/hadoop-aws-${HADOOP_VERSION}.jar
cp hadoop/share/hadoop/tools/lib/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar spark/jars/aws-java-sdk-bundle-${AWS_SDK_VERSION}.jar
popd
