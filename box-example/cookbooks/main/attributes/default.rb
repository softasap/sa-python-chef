# This is a Chef attributes file. It can be used to specify default and override
# attributes to be applied to nodes that run this cookbook.

# Set a default name
default['main']['name'] = 'Play to install role on a remote box'

default['main']['remote_host_address'] = '128.199.33.17'
default['main']['remote_host_user']    = 'root'
default['main']['remote_host_key']     = '~/.ssh/id_rsa'

# For further information, see the Chef documentation (https://docs.chef.io/essentials_cookbook_attribute_files.html).
