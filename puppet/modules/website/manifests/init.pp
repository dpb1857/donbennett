
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

    file { '/etc/nginx/sites-available/default':
        source => "puppet:///modules/website/default",
        owner => "root",
        group => "root",
    }
}
