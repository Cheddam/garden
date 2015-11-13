# Garden

A no-nonsense development environment for modern PHP applications. Built with special sauce for [Silverstripe](http://www.silverstripe.org).

## Included Software

- Debian Jessie
- Nginx
- PHP 5.6
- MariaDB

## Coming Soon

- Composer
- SSPak
- Phalcon
- All those other tools that are super relevant rn

## Site Configuration

Place your projects in the provided folder and they will be shared to the box. Garden supports infinite* virtualhosts that can be configured very simply within `puppet/sites.yaml`, following a simple syntax:

```yaml
---
vhosts:
    'sitename':
        folder: 'subfolderofprojects/public'
        domain: 'local.sitename.io'
        silverstripe: true # add this flag if your project is SilverStripe-based for required Nginx tweaks
```

Make sure you add the domain to your hosts file:

```
192.168.33.15  local.sitename.io
```

I intend to write a functional shell script for creating these in one step in the near future.

*: Nginx may explode under the weight of your virtualhosts if you take this advice to heart