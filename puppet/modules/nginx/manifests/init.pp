class nginx {

    file { "/var/www/projects":
        ensure => link,
        target => "/home/vagrant/projects",
    }

    package { 'nginx':
        ensure  => present,
        require => Exec['apt-get update'],
    }

    service { 'nginx':
        ensure  => running,
        require => Package['nginx'],
    }

    file { 'ss-conf':
        path    => '/etc/nginx/snippets/silverstripe.conf',
        ensure  => present,
        source  => 'puppet:///modules/nginx/silverstripe.conf',
        require => Package['nginx'],
    }

    create_resources(nginx::vhost, hiera('vhosts'))

    file { 'default-nginx-disable':
        path    => '/etc/nginx/sites-enabled/default',
        ensure  => absent,
        require => Package['nginx'],
    }


}