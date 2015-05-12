# == Class collectd::params
#
# This class is meant to be called from collectd.
# It sets variables according to platform.
#
class collectd::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'collectd'
      $service_name = 'collectd'
    }
    'RedHat', 'Amazon': {
      $package_name = 'collectd'
      $service_name = 'collectd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
