#!/bin/bash -eu

#
# Note:
# [1] We use the asterisk so the ddeb dbgsym package is also
#     installed.
# [2] One a stock machine we don't actually need --no-remove
#     but it doesn't hurt to put it here just in case someone
#     copies this command in a delphix appliance.
#
sudo apt-get install --no-remove -y ../libkdumpfile*deb
[ $? -eq 0 ] || exit 1
