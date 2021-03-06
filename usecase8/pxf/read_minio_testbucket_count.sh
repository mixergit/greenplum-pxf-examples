#!/bin/bash

set -e

current=`pwd`

cd `dirname $0`

. ./setEnv.sh

# Determine greenplum installation
if [ -d "/usr/local/gpdb" ]
then
  psql -h ${GREENPLUM_HOST} -U ${GREENPLUM_USER} -d ${POSTGRES_DB} -f ./read_minio_testbucket_stocks_csv_count.sql
else
  if [ -d "/usr/local/greenplum-db" ]
  then
    psql -h ${GREENPLUM_HOST} -U ${GREENPLUM_USER} -d ${POSTGRES_DB}  -f ./read_minio_testbucket_stocks_csv_count.sql
  else
      echo "Error: Directory /usr/local/greenplum-db does not exists."
  fi
fi

cd $current
