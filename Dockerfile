# This is a JDK servic docker
FROM centos
LABEL author="gclm"
LABEL version="1.0.2"
LABEL description="基于 Orale JDK 8u231封装"

ADD lib/jdk-8u231-linux-x64.tar.gz /usr/local

ENV JAVA_HOME /usr/local/jdk1.8.0_231
ENV PATH $JAVA_HOME/bin:$PATH