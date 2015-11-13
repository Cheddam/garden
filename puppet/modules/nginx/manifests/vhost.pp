define nginx::vhost (
    $folder,
    $domain,
    $silverstripe = false,
) {
    file { "/etc/nginx/sites-available/${name}":
        path   => "/etc/nginx/sites-available/${name}",
        ensure => file,
        require => [
            Package['nginx'],
            File['ss-conf'],
        ],
        owner => root,
        group => root,
        mode => 644,
        content => template("/vagrant/puppet/modules/nginx/files/vhost.erb"),
    }

    file { "/etc/nginx/sites-enabled/${name}":
        path   => "/etc/nginx/sites-enabled/${name}",
        target => "/etc/nginx/sites-available/${name}",
        ensure => link,
        notify => Service['nginx'],
    }
}