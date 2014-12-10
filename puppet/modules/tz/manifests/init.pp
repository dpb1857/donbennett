
class tz {
    file {"/etc/timezone":
         source => "puppet:///modules/tz/etc/timezone",
         owner => "root",
         group => "root",
    }
}
