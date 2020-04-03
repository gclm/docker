# This is a JDK servic docker
FROM alpine:3.11
LABEL author="gclm"
LABEL version="1.1.2"
LABEL description="基于 Orale JDK 8u231封装"

#1.更新Alpine的软件源为阿里云，因为从默认官源拉取实在太慢了
RUN echo http://mirrors.aliyun.com/alpine/v3.11/main/ > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.11/community/ >> /etc/apk/repositories
RUN apk update && apk upgrade

#2. 设置时区为上海
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

#3. 添加jdk
ADD jdk-8u231-linux-x64.tar.gz /usr/local

#4. 配置环境变量 
ENV JAVA_HOME /usr/local/jdk1.8.0_231
ENV PATH $JAVA_HOME/bin:$PATH