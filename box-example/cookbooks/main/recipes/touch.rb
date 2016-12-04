execute 'touch file' do
  command 'touch ~/chef_provisioned'
  ignore_failure true
  not_if { ::File.exist?('~/chef_provisioned') }
  action :run
end
