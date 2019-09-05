node default {
  exec { 'apt-get update':
      command => '/usr/bin/apt-get update',
  }

  Package { ensure => 'installed',
      require => Exec['apt-get update'],
  }

  $to_install = [ 'nginx', 'nginx-extras' ]

  package { $to_install:  }

  service { 'nginx':
      ensure => running,
  }

  file { '/etc/nginx/sites-available/default':
      ensure => file,
      content => template('nginx/default_site.conf'),
      require => Package['nginx'],
      notify => Service['nginx'],
  }

}
