#!/usr/bin/env ruby
require 'rubygems'
require 'hetzner-bootstrap-coreos'
require 'json'

bs = Hetzner::Bootstrap::CoreOS.new(
  :api => Hetzner::API.new(ENV['ROBOT_USER'], ENV['ROBOT_PASSWORD'])
)

servers = JSON.parse(File.read('servers.json'))

def cloud_config metadata
<<EOT
hostname: <%= hostname %>
ssh_authorized_keys:
  - <%= public_keys %>
coreos:
  units:
    - name: etcd.service
      command: start
    - name: fleet.service
      command: start
  etcd:
    name: <%= hostname %>
    discovery: https://discovery.etcd.io/6d0e7ffc0e9b8b9cc54832d992967d4e
  fleet:
    metadata: #{metadata}
EOT
end

ARGV.each do |server_name|
  puts "Looking for #{server_name}"
  server_details = servers[server_name]
  if !server_details
    puts "Server name not in server dictionary. Please check server name in servers.json"
    exit 1
  else
    server_ip = server_details['address']
    puts "Found IP #{server_ip}"
    bs << {:ip => server_ip,
           :cloud_config => cloud_config(metadata),
           :hostname => "#{server_name}.labs.crossref.org",
           :public_keys => '~/.ssh/id_rsa.pub'
    }
  end
end

puts "Bootstrapping #{ARGV.join(',')}..."
bs.bootstrap!

