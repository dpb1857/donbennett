
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

  user {'iphands':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
    groups => ["sudo"],
  }

  file {"/home/iphands":
      source => "puppet:///modules/users/iphands",
      owner => "iphands",
      group => "iphands",
      recurse => true,
  }
}
