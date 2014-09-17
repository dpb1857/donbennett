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
    sudo ./run-puppet.sh

At linode, this script is configured to run at first boot using their stack-scripts facility.
You can see the full script in linode/stack-script.


Admin Tasks
===========

Adding a User
-------------
Edit the file *puppet/modules/users/manifests* and add a section for the new user, modeled from the existing users.

If the user needs superuser access, be sure to include the line adding them to the sudo group.

To add the user ssh public key, create the file *puppet/modules/users/files/USERNAME/.ssh/authorized_keys2* with the contents of
the public ssh key for that user.

To activate the new user:

    cd /opt/rusa/puppet
    sudo ./run_puppet.sh


Adding Git access for that user
-------------------------------

    cd /opt/rusa/puppet/modulesusers/files/git/.ssh
    *edit the file authorized_keys2, add the new ssh public key to the end*
    cd /opt/rusa/puppet
    sudo ./run-puppet.sh


Adding staging deployment access
--------------------------------

    cd /opt/rusa/puppet/modulesusers/files/rusa/.ssh
    *edit the file authorized_keys2, add the new ssh public key to the end*
    cd /opt/rusa/puppet
    sudo ./run-puppet.sh


Site Content Workflow
=====================

Checkout the static site from git
---------------------------------

For any modifications to the site static content, you must first checkout the site from git:

    cd $HOME
    git clone git@localhost:site-static

Create a branch to work in
--------------------------

    cd site-static
    git checkout -b MY_BRANCH

Make changes and edit files
---------------------------

Add files and edit files as necesary.


See what the website looks like from your branch
------------------------------------------------

To run a webserver that shows what the site would look like based on the contents of the files you have checked out:

    # Process the .it files and generate the .html files;
    make

    # Run a debug webserver; it should tell you the port you can use to connect to it;
    fab debug

Publish the branch to the staging server
----------------------------------------

    # Push the files to the staging area;
    fab stage

This will push your current working tree to the staging server, where they will be visible at http://linode.rusa.org.

    # Merge your changes;
    git add NEWFILES
    git push origin BRANCHNAME

If you're happy with the changes, you can then merge them into the master branch:

    INSERT INSTRUCTIONS HERE


Example
-------

    #
    # You can skip the clone step if you already have the cloned repository around somewhere;
    #
    [dpb@linode.rusa.org] % git clone git@linode.rusa.org:site-static
    Cloning into 'site-static'...
    remote: Counting objects: 1679, done.
    remote: Compressing objects: 100% (1496/1496), done.
    remote: Total 1679 (delta 194), reused 1635 (delta 166)
    Receiving objects: 100% (1679/1679), 189.52 MiB | 17.63 MiB/s, done.
    Resolving deltas: 100% (194/194), done.
    Checking out files: 100% (1571/1571), done.
    [dpb@linode.rusa.org] %

    #
    # Create a branch to work on;
    #
    [dpb@linode.rusa.org] % git checkout -b updates
    Switched to a new branch 'updates'
    [dpb@linode.rusa.org] %

    #
    # Launch an editor to make modifications to the front page;
    #
    [dpb@linode.rusa.org] % cd site-static
    [dpb@linode.rusa.org] % ls
    Download/  fabfile.py  html/  Images/  Makefile  README.md  scripts/  src/  tools/
    [dpb@linode.rusa.org] % emacs src/index.it

    # DO THE EDITS;

    #
    # Rebuild html files from it files;
    #
    [dpb@linode.rusa.org] % make
    tools/pp.py -m /www/sources=src src/1200kms.it > src/1200kms.html
    tools/pp.py -m /www/sources=src src/2009-10.it > src/2009-10.html
    tools/pp.py -m /www/sources=src src/2009-12.it > src/2009-12.html
    ...

    #
    # Take a look at the changes before we merge;
    #
    [dpb@linode.rusa.org] % fab debug
    [localhost] local: ./tools/nginx.py --port=8080
    INFO:root:Starting nginx on port 8080
    nginx: [alert] could not open error log file: open() "/var/log/nginx/error.log" failed (13: Permission denied)
    75.25.137.232 - - [17/Sep/2014:04:54:15 +0000] "GET / HTTP/1.1" 200 12665 "-" "Mozilla/5.0 (X11; Linux x86_64) Appl\
    eWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36"

    # Now, I can look at the changes in my browser at http://linode.rusa.org:8080/
    # if I need to, I can continue editing;

    #
    # Commit my changes;
    #

    ###  Let's look at what changed:

    [dpb@linode.rusa.org] % git status
    # On branch updates
    # Changes not staged for commit:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #       modified:   src/index.it
    #
    no changes added to commit (use "git add" and/or "git commit -a")
    [dpb@linode.rusa.org] %

    # Add file to set of changes we want in this commit and check it in;

    [dpb@linode.rusa.org] % git add src/index.it
    [dpb@linode.rusa.org] % git commit -m "Added jersey deadline to the dates mini-line on homepage"
    [updates ebe1c08] Added jersey deadline to the dates mini-line on homepage
     1 file changed, 1 insertion(+), 3 deletions(-)

    # Push the branch back up to the git repository;

    [dpb@linode.rusa.org] % git push origin updates
    Counting objects: 7, done.
    Compressing objects: 100% (4/4), done.
    Writing objects: 100% (4/4), 441 bytes, done.
    Total 4 (delta 3), reused 0 (delta 0)
    To git@linode.rusa.org:site-static
     * [new branch]      updates -> updates
    [dpb@linode.rusa.org] %

    # Push the changes so they will be visible at http://linode.rusa.org/ , even after I shutdown my debug server;

    [dpb@linode.rusa.org] % fab deploy
    [localhost] local: make
    make: Nothing to be done for `html'.
    [localhost] local: rsync -avc  --exclude '*.it' --exclude '*.ih' --delete-after src/ rusa@localhost:/usr/share/nginx/www
    building file list ... done
    ./
    1200kms.html
    2009-10.html
    2009-12.html
    ...

    # Changes are now live at http://linode.rusa.org/

    # Now, let's merge the changes and push them back up to the master;

    [dpb@linode.rusa.org] % git checkout master
    Switched to branch 'master'
    [dpb@linode.rusa.org] % git merge updates
    Updating 1e216bc..ebe1c08
    Fast-forward
     src/index.it |    4 +---
     1 file changed, 1 insertion(+), 3 deletions(-)
    [dpb@linode.rusa.org] 49% git push
    Total 0 (delta 0), reused 0 (delta 0)
    To git@linode.rusa.org:site-static
       1e216bc..ebe1c08  master -> master
    [dpb@linode.rusa.org] %
