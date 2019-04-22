#!/bin/bash

#/usr/bin/mongod --fork --logpath /var/log/mongod.log --config /etc/mongodb.conf
#nohup rabbitmq-server &
EXCLUDE_URLS='.*github.com' python3 -u crawler/crawler.py https://vitkhab.github.io/search_engine_test_site/
