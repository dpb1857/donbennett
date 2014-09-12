
class devtools {
    package {'emacs':
	ensure => installed,
    }

    package {'mg':
	ensure => installed,
    }

    package {'make':
	ensure => installed,
    }

    package {'python-pip':
	ensure => installed,
    }
}
