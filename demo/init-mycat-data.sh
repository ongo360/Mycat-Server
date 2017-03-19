#!/usr/bin/env bash

docker run -ti --rm --link mycat -v  $(pwd)/data/insert.sql:/insert.sql \
     mysql:5.6 sh -c ' exec mysql -umycat -pmycat -h mycat --port 8066 < /insert.sql  '


