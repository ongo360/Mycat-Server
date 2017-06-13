#!/usr/bin/env bash


mvn clean package -Dmaven.test.skip=true

docker build -t ongo360/mycat:1.6.1 .

docker tag ongo360/mycat:1.6.1 registry.cn-hangzhou.aliyuncs.com/ongo360/mycat:1.6.1 

docker login --username=at1927u0d@aliyun.com registry.cn-hangzhou.aliyuncs.com

docker push registry.cn-hangzhou.aliyuncs.com/ongo360/mycat:1.6.1