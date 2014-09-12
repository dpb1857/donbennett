
node /.*\.com/ {
    include website
    include devtools
    include systools
    include users
    include sudoers
}

node /.*\.org/ {
    include website
    include devtools
    include systools
    include users
    include sudoers
}
