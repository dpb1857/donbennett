
class users {

  user {'git':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
  }

  file {"/home/git/.ssh":
      source => "puppet:///modules/users/git/.ssh",
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

  file {"/home/dpb/.ssh":
      source => "puppet:///modules/users/dpb/.ssh",
      owner => "dpb",
      group => "dpb",
      recurse => true,
  }
}
