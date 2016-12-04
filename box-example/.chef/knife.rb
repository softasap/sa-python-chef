chef_repo = File.join(File.dirname(__FILE__), "..")
current_dir = File.dirname(__FILE__)
user_email  = `git config --get user.email`

home_dir    = ENV['HOME'] || ENV['HOMEDRIVE']
org         = ENV['chef_org'] || 'my_org'

knife_override =       "#{home_dir}/.chef/knife_override.rb"
knife_override_local = "#{current_dir}/knife.local.rb"


log_level                :info
log_location             STDOUT


node_name                "provisioner"
client_key               "#{current_dir}/dummy.pem"
validation_client_name   "validator"


#puts chef_repo.inspect
verify_api_cert false
chef_server_url "http://127.0.0.1:8889"

cookbook_path     ["#{chef_repo}/berks-cookbooks"]
node_path         "#{chef_repo}/nodes"
role_path         "#{chef_repo}/roles"
environment_path  "#{chef_repo}/environments"
data_bag_path     "#{chef_repo}/data_bags"

cache_type      "BasicFile"
cache_options   :path => "#{chef_repo}/checksums"

# This file exists mainly to ensure we don't pick up knife.rb from anywhere else
local_mode true
config_dir "#{File.expand_path('..', __FILE__)}/" # Wherefore art config_dir, chef?

#puts config_dir
# Chef 11.14 binds to "localhost", which interferes with port forwarding on IPv6 machines for some reason
begin
   chef_zero.host '127.0.0.1'
   #chef_zero.host '0.0.0.0'
   chef_zero.port '8889'
rescue
end


# Allow overriding values in this knife.rb
Chef::Config.from_file(knife_override) if File.exist?(knife_override)
Chef::Config.from_file(knife_override_local) if File.exist?(knife_override_local)

