if [ -e /etc/vagrantinitrun ]
then
    echo 'Skipping Puppet installation.'
else
    echo 'Installing Puppet...'
    wget https://apt.puppetlabs.com/puppetlabs-release-jessie.deb >/dev/null 2>&1
    dpkg -i puppetlabs-release-jessie.deb &>/dev/null 2>&1
    apt-get update >/dev/null 2>&1
    apt-get install puppet -y >/dev/null 2>&1
    echo 'Placing Hiera.yaml...'
    cp /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml >/dev/null 2>&1
    echo 'Done.'
    touch /etc/vagrantinitrun 2>&1
fi