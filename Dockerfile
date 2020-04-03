# This is a JDK servic docker
FROM alpine:3.11
LABEL author="gclm(gclm159@gmail.com)"
LABEL version="1.2.3"
LABEL description="基于 Orale 8u241 JRE 封装"

#******************基础环境配置******************
#1.更新Alpine的软件源为阿里云，因为从默认官源拉取实在太慢了
RUN echo http://mirrors.aliyun.com/alpine/v3.11/main/ > /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/v3.11/community/ >> /etc/apk/repositories
RUN apk update && apk upgrade

#2. 设置时区为上海
RUN apk add tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata

#******************Alpine安装 Glibc https://github.com/sgerrand/alpine-pkg-glibc *****************
#3. 创建目录
WORKDIR /usr/local/jdk

#4.将一些安装包复制到镜像中，语法：ADD/COPY <src>... <dest>
## ADD与COPY的区别：ADD复制并解压，COPY仅复制
## glibc安装包如果从网络下载速度实在是太慢了，先提前下载复制到镜像中
ADD jre-8u241-mini-linux-x64.tar.gz /usr/local/jdk/

#5.运行指定的命令
## Alpine linux为了精简本身并没有安装太多的常用软件,apk类似于ubuntu的apt-get，
## 用来安装一些常用软V件，其语法如下：apk add bash wget curl git make vim docker
## wget是linux下的ftp/http传输工具，没安装会报错“/bin/sh: 　　wget: not found”
## ca-certificates证书服务，是安装glibc前置依赖
RUN apk --no-cache add ca-certificates wget \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.31-r0/glibc-2.31-r0.apk \
    && apk add glibc-2.31-r0.apk  \
    && rm -rf /var/cache/apk/* glibc-2.31-r0.apk 


#******************设置JAVA变量环境******************
#6.配置环境变量
ENV JAVA_HOME=/usr/local/jdk/jre1.8.0_241
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$PATH
