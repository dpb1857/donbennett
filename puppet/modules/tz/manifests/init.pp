
# If installing this module is insufficient, do:
#   dpkg-reconfigure tzdata
#
# Also need to update /etc/localtime, if I knew how to do this with puppet;
# TZ=PST8PDT
# echo $TZ > /etc/timezone
# /bin/cp -f /usr/share/zoneinfo/$TZ /etc/localtime

class tz {
    file {"/etc/timezone":
         source => "puppet:///modules/tz/etc/timezone",
         owner => "root",
         group => "root",
    }
}
