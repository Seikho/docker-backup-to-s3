#!/bin/bash

set -e

echo "Job started: $(date)"

rm -rf /tmp/backup.tar.gz
tar -zcf /tmp/backup.tar.gz -C $DATA_PATH .
/usr/local/bin/s3cmd sync $PARAMS /tmp/backup.tar.gz "$S3_PATH"

echo "Job finished: $(date)"
