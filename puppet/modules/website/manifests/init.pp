
class website {
    package {'nginx':
	ensure => installed,
    }

    package {'uwsgi':
	ensure => installed,
    }

    package {'uwsgi-plugin-cgi':
	ensure => installed,
    }

    file { '/usr/share/nginx':
        ensure => "directory",
        owner => "rusa",
        group => "rusa",
        mode  => 0644,
        recurse => true,
    }

    file { '/etc/nginx/sites-available/default':
        source => "puppet:///modules/website/default",
        owner => "root",
        group => "root",
    }

    file {'/etc/uwsgi/apps-enabled/rusa-cgi.ini':
        source => "puppet:///modules/website/rusa-cgi.ini",
        owner => "root",
        group => "root",
   }
}
