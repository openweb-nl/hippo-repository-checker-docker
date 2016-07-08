#!/bin/bash
cd /usr/local/hippo-addon/checker
cp checker-repository.xml.template checker-repository.xml
sed  's/${DB_HOST}/'$DB_HOST'/g;s/${DB_PORT}/'$DB_PORT'/g;s/${DB_NAME}/'$DB_NAME'/g;s/${DB_USER}/'$DB_USER'/g;s/${DB_PASS}/'$DB_PASS'/g' checker-repository.xml.template > checker-repository.xml
if [ ! -s checker.properties ]; then
    java -jar hippo-addon-checker.jar props > checker.properties.generated &&\
    sed "/rep.config=/ s/=.*/=checker-repository.xml/" checker.properties.generated > checker.properties
fi
java ${JVM_OPTS} -jar hippo-addon-checker.jar $@