class nginx {
  exec { 'apt-get update':
      command => '/usr/bin/apt-get update',
  }

  package { 'nginx':
      tag 'nginx',
      ensure => present,
      require => Exec['apt-get update'],
  }

  service { 'nginx':
    ensure => running,
  }
}
