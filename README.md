rusa
====

This repo contains the bootstrap and machine configuration for the rusa website.


Machine Configuration
=====================

Machine configuration is managed by puppet.

To configure the RUSA machine by hand after first booting:

    <as root>
    apt-get update
    apt-get upgrade -y
    apt-get install git puppet

    mkdir -p /opt
    cd /opt
    git clone git@github.com:RandonneursUSA/rusa

    cd /opt/rusa/puppet
    ./run-puppet.sh

At linode, this script is configured to run at first boot using their stack-scripts facility.
You can see the full script in linode/stack-script.


Admin Tasks
===========

Adding a User
-------------
Edit the file *puppet/modules/users/manifests* and add a section for the new user, modeled from the existing users.

To add the user ssh public key, create the file *puppet/modules/users/files/USERNAME/.ssh/authorized_keys2* with the contents of
the public ssh key for that user.

To activate the new user:

    cd /opt/rusa/puppet
    sudo ./run_puppet.sh


Site Content Tasks
==================

Checkout the static site from git
---------------------------------

For any modifications to the site static content, you must first checkout the site from git:

    cd $HOME
    git clone git@localhost:site-static

Create a branch to work in
--------------------------

    cd site-static
    git checkout -b MY_BRANCH

See what the website looks like from your branch
------------------------------------------------


To run a webserver that shows what the site would look like based on the contents of the files you have checked out:

    # Process the .it files and generate the .html files;
    make

    # Run a debug webserver; it should tell you the URL you can use to connect to it;
    fab debug
