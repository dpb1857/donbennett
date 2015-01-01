
class website {
    package {'nginx':
	ensure => installed,
    }

    package {'uwsgi':
	ensure => installed,
    }

    file { '/usr/share/nginx':
        ensure => "directory",
        owner => "www-data",
        group => "www-data",
        mode  => 0644,
        recurse => true,
    }

    file { '/etc/nginx/sites-enabled':
        source => "puppet:///modules/website/sites-enabled",
        owner => "root",
        group => "root",
	recurse => true,
    }

    file { '/etc/supervisor/conf.d/pbpresults.conf':
        source => "puppet:///modules/website/supervisor-conf.d/pbpresults.conf",
        owner => "root",
        group => "root",
        require => Package['supervisor'],
    }

}
