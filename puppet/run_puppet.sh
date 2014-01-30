#!/bin/sh

set -x
sudo puppet apply --confdir=`pwd` manifests/site.pp
