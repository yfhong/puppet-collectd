# == Class collectd::service
#
# This class is meant to be called from collectd.
# It ensure the service is running.
#
class collectd::service {

  service { $::collectd::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
