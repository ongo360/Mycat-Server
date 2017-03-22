#!/usr/bin/env bash

docker rm -f mycat

docker run -d --link dw1 --link dw2    \
     --name mycat  \
     -p 8066:8066 -p 9066:9066 \
     -v $(pwd)/conf/server.xml:/opt/mycat/conf/server.xml              \
     -v $(pwd)/conf/rule.xml:/opt/mycat/conf/rule.xml                  \
     -v $(pwd)/conf/schema.xml:/opt/mycat/conf/schema.xml              \
     -v $(pwd)/conf/log4j.xml:/opt/mycat/conf/log4j.xml                \
     -v $(pwd)/conf/user-partition.txt:/opt/mycat/conf/user-partition.txt \
     -v $(pwd)/conf/order-id-partition.txt:/opt/mycat/conf/order-id-partition.txt \
     -v $(pwd)/conf/order-number-partition.txt:/opt/mycat/conf/order-number-partition.txt \
     -v $(pwd)/conf/order-detail-id-partition.txt:/opt/mycat/conf/order-detail-id-partition.txt \
     -v $(pwd)/conf/task-partition.txt:/opt/mycat/conf/task-partition.txt \
     ongo360/mycat:1.6.1



