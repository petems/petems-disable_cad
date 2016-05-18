# Class: disable_cad
# ===========================
class disable_cad (
  $ctrlaltdel_process = $disable_cad::params::ctrlaltdel_process,
) inherits ::disable_cad::params {

  # Every version of RHEL has a different way of doing this! :)
  case $::operatingsystemmajrelease {
    '4','5': {
      augeas { 'disable-inittab-ctrlaltdel':
        context => '/files/etc/inittab',
        lens    => 'inittab.lns',
        incl    => '/etc/inittab',
        changes => "set *[action = 'ctrlaltdel']/process '${ctrlaltdel_process}'",
      }
    }
    '6': {
      file { '/etc/init/control-alt-delete.conf':
        ensure  => file,
        content => $ctrlaltdel_process,
      }
    }
    '7': {
      file { '/etc/systemd/system/ctrl-alt-del.target':
        ensure => 'link',
        target => '/dev/null',
      }
    }
    default: {
      fail("Module ${module_name} is not supported on this ${::operatingsystemmajrelease}")
    }
  }
}
