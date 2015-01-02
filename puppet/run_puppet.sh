#!/bin/sh

set -x
cd `dirname $0`
find . -name \*~ -print|xargs rm -f
sudo puppet apply --confdir=`pwd` manifests/site.pp
