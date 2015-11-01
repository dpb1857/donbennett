
class users {

  file {"/root/.ssh":
      source => "puppet:///modules/users/root/.ssh",
      owner => "root",
      group => "root",
      recurse => true,
  }

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

  user {'deborah':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
    groups => ["sudo"],
  }

  file {"/home/deborah/.ssh":
      source => "puppet:///modules/users/deborah/.ssh",
      owner => "deborah",
      group => "deborah",
      recurse => true,
  }
}
