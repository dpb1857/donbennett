#!/bin/sh

set -x
apt-get -y install git puppet

cd /opt
git clone https://github.com/RandonneursUSA/rusa.git
./rusa/puppet/run_puppet.sh

echo "Finished puppetized setup."
