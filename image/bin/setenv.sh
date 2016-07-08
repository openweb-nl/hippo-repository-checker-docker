#!/bin/bash

JVM_OPTS="-Xmx${MAX_HEAP}m -Xms${MIN_HEAP}m -XX:+UseG1GC -Djava.util.Arrays.useLegacyMergeSort=true -Dfile.encoding=${ENCODING} ${EXTRA_JVM_OPTS}"
CATALINA_OPTS="${JVM_OPTS}"

export JVM_OPTS CATALINA_OPTS
echo "set jvm opts to ${JVM_OPTS}"