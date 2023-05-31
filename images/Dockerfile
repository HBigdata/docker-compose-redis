FROM registry.cn-hangzhou.aliyuncs.com/bigdata_cloudnative/centos:7.7.1908

RUN rm -f /etc/localtime && ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone

RUN export LANG=zh_CN.UTF-8

RUN yum -y install install net-tools telnet wget nc less gcc gcc++ make

RUN mkdir /opt/apache/

# 编译安装 redis
ENV REDIS_VERSION 7.0.3
ADD redis-${REDIS_VERSION}.tar.gz /opt/apache/
ENV REDIS_HOME /opt/apache/redis
RUN ln -s /opt/apache/redis-${REDIS_VERSION} $REDIS_HOME

# 开始编译
RUN cd $REDIS_HOME && make && make install

# 创建数据目录
RUN mkdir ${REDIS_HOME}/data

# copy bootstrap.sh
COPY bootstrap.sh /opt/apache/
RUN chmod +x /opt/apache/bootstrap.sh

WORKDIR $KAFKA_HOME
