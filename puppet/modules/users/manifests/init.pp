
class users {
  user {'dpb':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
    groups => ["sudo"],
  }

  file {"/home/dpb":
      source => "puppet:///modules/users/dpb",
      owner => "dpb",
      group => "dpb",
      recurse => true,
  }
}
