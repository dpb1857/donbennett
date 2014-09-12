rusa
====

This repo contains the bootstrap and machine configuration for the rusa website.


To configure the RUSA machine from this repo:

    <as root>
    apt-get update
    apt-get install git puppet

    mkdir -p /opt/rusa
    cd /opt/rusa
    git clone git@github.com:RandonneursUSA/rusa

    cd /opt/rusa/puppet
    ./run-puppet.sh
