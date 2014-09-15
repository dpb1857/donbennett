
class website {
    package {'nginx':
	ensure => installed,
    }

    file { '/usr/share/nginx':
        ensure => "directory",
        owner => "rusa",
        group => "rusa",
        mode  => 755,
    }

    file { '/etc/nginx/sites-available/default':
        source => "puppet:///modules/website/default",
        owner => "root",
        group => "root",
    }
}
