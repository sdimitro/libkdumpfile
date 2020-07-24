#!/bin/bash -eu

#
# Needed for all the debian file related utilities.
#
sudo apt-get install -y debhelper devscripts equivs

#
# Build dependencies from debian control file.
#
sudo mk-build-deps --install --tool='apt-get -o Debug::pkgProblemResolver=yes --no-install-recommends --yes' debian/control
