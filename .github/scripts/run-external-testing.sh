#!/bin/bash -eu

#
# Ensure the package is installed and works as expected.
# To do so we download a kdump-compressed crash dump
# that we've already archived on S3 and run one of
# the example libkdumpfile utilities on it, verifying
# that it works as expected.
#
whereis libkdumpfile
[ $? -eq 0 ] || exit 1

python3 -m pip install aws
[ $? -eq 0 ] || exit 1

/usr/local/bin/aws s3 cp --no-sign-request s3://sdb-regression-dumps/dump-201912060006.tar.lzma .
[ $? -eq 0 ] || exit 1

tar -x --lzma -f dump-201912060006.tar.lzma
[ $? -eq 0 ] || exit 1

dumpattr dump-data/dump.201912060006 arch.page_size
[ $? -eq 0 ] || exit 1
