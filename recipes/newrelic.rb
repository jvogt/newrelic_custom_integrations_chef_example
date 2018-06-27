#
# Cookbook:: newrelicinfratest
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'newrelic-infra'

directory 'C:\Program Files\New Relic\newrelic-infra\custom-integrations\newrelic-infra-netstats'

remote_file 'C:\Program Files\New Relic\newrelic-infra\custom-integrations\newrelic-infra-netstats\pstcp.ps1' do
  source 'http://104.42.173.61/pstcp.ps1'
end

conf_files = [
  'C:\Program Files\New Relic\newrelic-infra\custom-integrations\newrelic-infra-netstats-definition.yml',
  'C:\Program Files\New Relic\newrelic-infra\integrations.d\newrelic-infra-netstats-config.yml'
]

conf_files.each do |cf|
  cookbook_file cf do
    action :create
    notifies :reload, 'service[newrelic-infra]', :delayed
  end
end
