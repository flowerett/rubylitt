# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
# role :app, %w{apps@vmlocal}
# role :web, %w{apps@vmlocal}
# role :db,  %w{apps@vmlocal}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
# server 'vmlocal', user: 'apps', roles: %w{web app db}

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server
# server '127.0.0.1',
#   user: 'apps',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'apps', # overrides user setting above
#     keys: %w(/home/flowerett/.vagrant.d/insecure_private_key),
#     forward_agent: false,
#     port: 2222
#     # auth_methods: %w(publickey password)
#     # password: 'please use keys'
# }

set :stage, :staging
set :rack_env, :staging

server '127.0.0.1', user: 'apps', roles: %w{web app}

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :ssh_options, {
  user: 'apps',
  keys: %w(/home/flowerett/.vagrant.d/insecure_private_key),
  forward_agent: false,
  port: 2222
}