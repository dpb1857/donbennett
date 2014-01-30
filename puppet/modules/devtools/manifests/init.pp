
class devtools {
    package {'emacs':
	ensure => installed,
    }

    package {'mg':
	ensure => installed,
    }
}
