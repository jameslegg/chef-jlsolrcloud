group node['jlsolrcloud']['group'] do
  action :create
end

user node['jlsolrcloud']['user'] do
  home node['jlsolrcloud']['user_home'] if node['jlsolrcloud']['user_home']
  shell '/bin/bash'
  gid node['jlsolrcloud']['group']
  action :create
end
