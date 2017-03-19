#!/usr/bin/env bash

docker run -ti --rm --link mycat mysql:5.6 mysql -umycat -pmycat -hmycat --port 8066