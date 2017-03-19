#!/usr/bin/env bash

docker rm -f dw1 dw2

docker run -d --name dw1 -e MYSQL_ROOT_PASSWORD=rootpass -p 13306:3306 mysql:5.6 --lower-case-table-names=1
docker run -d --name dw2 -e MYSQL_ROOT_PASSWORD=rootpass -p 23306:3306 mysql:5.6 --lower-case-table-names=1

sleep 30

docker run --rm --link dw1 \
    -v $(pwd)/data/schema.sql:/schema.sql \
    mysql:5.6 sh -c ' exec mysql -uroot -prootpass -h dw1 < /schema.sql  '

docker run --rm --link dw2 \
    -v $(pwd)/data/schema.sql:/schema.sql \
    mysql:5.6 sh -c ' exec mysql -uroot -prootpass -h dw2 < /schema.sql  '