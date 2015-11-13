#!/bin/bash

ls
exit

# TODO: Improve this file when my bash-fu is up to spec

# Make sure all information has been provided
if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]
then
    echo 'Usage: new-site [name] [domain] [project-folder(/public)]'
    exit
fi

# Check for SilverStripe parameter
silverstripe=0

for i in "$@"
do
    case $i in 
        -ss|--silverstripe)
            silverstripe=1
            ;;
    esac
done

if [ $silverstripe -eq 1 ]
then
vhost=<<VHOST
    "$1":
        folder: "$3"
        domainname: "$2"
        silverstripe: true
VHOST
else
vhost=<<VHOST
    "$1":
        folder: "$3"
        domainname: "$2"
VHOST
fi

echo $vhost >> ./puppet/sites.yaml
vagrant provision