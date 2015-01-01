
class systools {
    package {'python-dev':
       ensure => installed,
    }

    package {'supervisor':
       ensure => installed,
    }

    exec {'python-fabric':
        command => "/usr/bin/pip install fabric",
        creates => "/usr/local/bin/fab",
        require => Package['python-dev'],
    }

    exec {'python-virtualenv':
        command => "/usr/bin/pip install virtualenv",
        creates => "/usr/local/bin/virtualenv",
        require => Package['python-dev'],
    }
}
