#!/bin/bash

set -e

echo "Job started: $(date)"

rm -rf /tmp/backup.tar.gz
tar -zcf /tmp/backup.tar.gz -C $DATA_PATH .
export TIME_PATH=$S3_PATH-$(date --iso-8601=seconds)
/usr/local/bin/s3cmd sync $PARAMS "$S3_PATH" "$TIME_PATH" || echo "First time"
/usr/local/bin/s3cmd sync $PARAMS /tmp/backup.tar.gz "$S3_PATH"

echo "Job finished: $(date)"
