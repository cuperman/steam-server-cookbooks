# Steam Server Cookbooks

Chef Cookbooks for provisioning Steam dedicated servers on Amazon AWS OpsWorks

## Provisioning Servers

Use Amazon AWS OpsWorks to provision servers. See [doc/ops_works.md](./doc/ops_works.md) for instructions.

## Games

The following steam games are supported:

- Counter-Strike: Global Offensive
- Team Fortress 2
- Left 4 Dead 2

## Configuration

Each game can be configured using chef attributes. The following are currently supported:

```ruby
# Counter-Strike: Global Offensive
default[:steamcmd][:csgo][:ip] = '0.0.0.0'
default[:steamcmd][:csgo][:port] = 27015
default[:steamcmd][:csgo][:map] = 'de_dust2'
default[:steamcmd][:csgo][:maxplayers] = 24

# Team Fortress 2
default[:steamcmd][:tf2][:ip] = '0.0.0.0'
default[:steamcmd][:tf2][:port] = 27016
default[:steamcmd][:tf2][:map] = 'mvm_decoy'
default[:steamcmd][:tf2][:maxplayers] = 32

# Left 4 Dead 2
default[:steamcmd][:l4d2][:ip] = '0.0.0.0'
default[:steamcmd][:l4d2][:port] = 27017
default[:steamcmd][:l4d2][:map] = 'c1m1_hotel'
default[:steamcmd][:l4d2][:maxplayers] = 8
```

## TODO

- Auto update
- More configuration options
