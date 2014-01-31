#!/bin/sh

set -x
cd `dirname $0`
sudo puppet apply --confdir=`pwd` manifests/site.pp
