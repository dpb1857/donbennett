donbennett
==========

This repo contains the bootstrap and machine configuration for donbennett.org.


Machine Configuration
=====================

Machine configuration is managed by puppet.

To configure donbennett.org machine by hand after first booting:

    <as root>
    apt-get update
    apt-get upgrade -y
    apt-get install git puppet

    mkdir -p /opt
    cd /opt
    git clone git@github.com:dpb1857/donbennett

    cd /opt/donbennett/puppet
    sudo ./run-puppet.sh

At linode, this script is configured to run at first boot using their stack-scripts facility.
You can see the full script in linode/stack-script.
