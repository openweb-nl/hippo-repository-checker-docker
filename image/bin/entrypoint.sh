#!/bin/bash
runcommand="$@"
if [ "$1" == "props" ] || \
  [ "$1" == "config" ] || \
  [ "$1" == "check" ] || \
  [ "$1" == "fix" ] || \
  [ "$1" == "dump" ] || \
  [ "$1" == "cleands" ] || \
  [ "$1" == "cleanvh" ]; then
  runcommand="checker.sh $@"
fi
source setenv.sh
echo "Waiting for database connection on ${DB_HOST}:${DB_PORT}..."
wait-for-it.sh -t 10 ${DB_HOST}:${DB_PORT} -s  -- \
echo "Successfully found the database connection..." && \
exec $runcommand