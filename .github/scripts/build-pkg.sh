#!/bin/bash -eu

dpkg-buildpackage -b -us -uc
[ $? -eq 0 ] || exit 1
