# ** #source 'https://supermarket.chef.io'
source :chef_server

metadata

cookbook 'clocker', git: 'https://github.com/jameslegg/chef-locker.git', tag: 'v0.3'

group :integration do
  cookbook 'jlsolrcloud_bootstrap',
           :path => './test/cookbooks/jlsolrcloud_bootstrap'
end

