
class mail {
    package {'mailutils':
	ensure => installed,
    }

    package {'postfix':
        ensure => installed,
    }

    file { '/etc/aliases':
	source => "puppet:///modules/mail/etc/aliases",
	owner => "root",
	group => "root",
        mode  => 0644,
    }

    exec { "/usr/bin/newaliases":
        subscribe => File["/etc/aliases"],
        refreshonly => true,
    }

    file { '/etc/postfix/main.cf':
	source => "puppet:///modules/mail/etc/postfix/main.cf",
	owner => "root",
	group => "root",
        mode  => 0644,
    }

    exec { "/usr/sbin/postfix reload":
        subscribe => File["/etc/postfix/main.cf"],
        refreshonly => true,
    }
}
