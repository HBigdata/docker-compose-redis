#!/usr/bin/env sh

wait_for() {
    echo Waiting for $1 to listen on $2...
    sleep 1
    while ! nc -z $1 $2; do echo waiting...; sleep 1s; done
}

node_type=$1

if [ $node_type = "slave" ];then
        wait_for redis-master 6379
fi

/usr/local/bin/redis-server /usr/local/redis/redis.conf

tail -f /usr/local/redis/redis.log
