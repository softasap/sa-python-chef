# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

require 'chef/provisioning/ssh_driver'

with_driver 'ssh'

machine 'ssh' do
  action [:ready, :setup, :converge]
  machine_options transport_options: {
    'ip_address' => node['main']['remote_host_address'],
    'username' => node['main']['remote_host_user'],
    'ssh_options' => {
      'keys' => [node['main']['remote_host_key']]
    },
    'options' => {
      'prefix' => 'sudo '
    }
  }
  recipe 'main::default'
  converge true
end

# with_machine_options  :transport_options => {
#         'is_windows' => false,
#         'ip_address' => '192.168.33.23',
#         'host' => 'somehost',
#         'username' => 'vagrant',
#         'ssh_options' => {
#             'auth_methods' => '',
#             'bind_address' => '',
#             'compression' => '',
#             'compression_level' => '',
#             'config' => '',
#             'encryption' => '',
#             'forward_agent' => '',
#             'hmac' => '',
#             'host_key' => '',
#             'keepalive' => '',
#             'keepalive_interval' => '',
#             'kex' => '',
#             'keys' => ['/home/username/.vagrant.d/insecure_private_key'],
#             'key_data' => '',
#             'languages' => '',
#             'logger' => '',
#             'paranoid' => '',
#             'password' => '',
#             'port' => '',
#             'proxy' => '',
#             'rekey_blocks_limit' => '',
#             'rekey_limit' => '',
#             'rekey_packet_limit' => '',
#             'timeout' => '',
#             'verbose' => '',
#             'global_known_hosts_file' => '',
#             'user_known_hosts_file' => '',
#             'host_key_alias' => '',
#             'host_name' => '',
#             'user' => '',
#             'properties' => '',
#             'passphrase' => '',
#             'keys_only' => '',
#             'max_pkt_size' => '',
#             'max_win_size, :send_env' => '',
#             'use_agent' => ''
#         },
#         'options' => {
#           'prefix' => 'sudo ',
#           'ssh_pty_enable' => false,
#           'ssh_gateway' => 'yourgateway'
#         }
#       }
