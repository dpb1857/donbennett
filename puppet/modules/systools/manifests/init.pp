
class systools {
    package {'python-dev':
       ensure => installed,
    }

    exec {'python-fabric':
        command => "/usr/bin/pip install fabric",
        creates => "/usr/local/bin/fab",
        require => Package['python-dev'],
    }
}
