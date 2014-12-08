
node /linode.rusa.org/ {
    include website
    include devtools
    include systools
    include users
    include sudoers
}

node /www.rusa.org/ {
    include website
    include devtools
    include systools
    include users
    include sudoers
}
