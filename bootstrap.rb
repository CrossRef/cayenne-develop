#!/usr/bin/env ruby
require 'rubygems'
require 'hetzner-bootstrap-coreos'
require 'json'

bs = Hetzner::Bootstrap::CoreOS.new(
  :api => Hetzner::API.new(ENV['ROBOT_USER'], ENV['ROBOT_PASSWORD'])
)

servers = JSON.parse(File.read('servers.json'))

cloud_config = <<EOT
hostname: <%= hostname %>
ssh_authorized_keys:
  - <%= public_keys %>
EOT

ARGV.each do |server_name|
  puts "Looking for #{server_name}"
  server_ip = servers[server_name]
  if !server_ip
    puts "Server name not in server dictionary. Please check server name in servers.json"
    exit 1
  else
    puts "Found IP #{server_ip}"
    bs << {:ip => server_ip,
           :cloud_config => cloud_config,
           :hostname => "#{server_name}.labs.crossref.org",
           :public_keys => '~/.ssh/id_rsa.pub'
    }
  end
end

puts "Bootstrapping #{ARGV.join(',')}..."
bs.bootstrap!

