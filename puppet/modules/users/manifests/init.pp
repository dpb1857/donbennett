
class users {
  user {'rusa':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
  }

  file {"/home/rusa":
      source => "puppet:///modules/users/rusa",
      owner => "rusa",
      group => "rusa",
      recurse => true,
  }

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

  user {'lynne':
    ensure => "present",
    managehome => true,
    shell => "/bin/bash",
  }

  file {"/home/lynne":
      source => "puppet:///modules/users/lynne",
      owner => "lynne",
      group => "lynne",
      recurse => true,
  }
}
