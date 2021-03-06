# == Class: kibana4
#
# Configuration
#
class kibana4::config {

  $version = $kibana4::package_ensure

  file { "${kibana4::install_dir}/kibana-${version}/config/kibana.yml":
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('kibana4/kibana.yml.erb'),
    notify  => Service['kibana4'],
  }

  file {$kibana4::pid_file:
    ensure => file,
    owner  => $kibana4::kibana4_user,
    group  => $kibana4::kibana4_group,
    mode   => '0644',
  }

}
