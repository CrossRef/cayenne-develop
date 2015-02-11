## Adding a Hetzner Server

Request a new server from within the Hetzner Robot console. Specify
a name for the server and an IP within `servers.json`.

## Bootrap Hetzner CoreOS Machines

1. Install ruby and the `bundler` gem.

2. Install gem dependencies with `bundle install`.

3. Run `bootstrap.rb` for any of the IPs in `servers.json`

    ROBOT_USER=user ROBOT_PASSWORD=password ./bootstrap.rb trinity

## Deploying Services
