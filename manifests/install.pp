# == Class collectd::install
#
# This class is called from collectd for install.
#
class collectd::install {

  package { $::collectd::package_name:
    ensure => present,
  }
}
