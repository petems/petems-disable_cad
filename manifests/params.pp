# Class: centos_errata::params
class disable_cad::params {

  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        'RedHat','CentOS': {
          $ctrlaltdel_process = '/usr/bin/logger -p security.info "Control-Alt-Delete pressed, but trapped to do nothing"'
        }
        default: {
          fail("This module is currently only supported on RedHat and CentOS, your OS was ${$::operatingsystem}")
        }
      }
    }
    default: {
      fail("This module is currently only supported on RedHat, your OSFamily was ${$::osfamily}")
    }
  }

}
