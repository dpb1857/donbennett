
class users {

  user {'git':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
  }

  file {"/home/git":
      source => "puppet:///modules/users/git",
      owner => "git",
      group => "git",
      recurse => true,
  }

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
