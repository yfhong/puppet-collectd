# == Class: collectd
#
# Full description of class collectd here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class collectd (
  $package_name = $::collectd::params::package_name,
  $service_name = $::collectd::params::service_name,
) inherits ::collectd::params {

  # validate parameters here

  class { '::collectd::install': } ->
  class { '::collectd::config': } ~>
  class { '::collectd::service': } ->
  Class['::collectd']
}
