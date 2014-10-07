
set :rails_env, :production
set :enable_ssl, false

set :user, "root"
set :server, "106.185.46.140"

ask_secretly(:password)
server fetch(:server), user: fetch(:user), port: 22, password: fetch(:password), roles: %w{web app db}


# role :web, domain                          # Your HTTP server, Apache/etc
# role :app, domain                          # This may be the same as your `Web` server
# role :db,  domain, :primary => true # This is where Rails migrations will run

# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# dirs we want symlinking to shared
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
# set :tests, []

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
# set(:config_files, %w(
#   nginx.conf
#   database.yml.example
#   secrets.yml.example
#   log_rotation
#   monit
#   unicorn.rb
#   unicorn_init.sh
# ))

# which config files should be made executable after copying
# by deploy:setup_config
# set(:executable_config_files, %w(
#   unicorn_init.sh
# ))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
# set(:symlinks, [
#   {
#     source: "nginx.conf",
#     link: "/etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
#   },
#   {
#     source: "unicorn_init.sh",
#     link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
#   },
#   {
#     source: "log_rotation",
#    link: "/etc/logrotate.d/#{fetch(:full_app_name)}"
#   },
#   {
#     source: "monit",
#     link: "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
#   }
# ])


# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

# namespace :deploy do
#   task :compile_assets_locally do
#     %x('RAILS_ENV=production rake assets:precompile')
#   end
# end


# namespace :deploy do
#   # make sure we're deploying what we think we're deploying
#   before :deploy, "deploy:check_revision"
#   # only allow a deploy with passing tests to deployed
#   before :deploy, "deploy:run_tests"
#   # compile assets locally then rsync
#   after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
#   after :finishing, 'deploy:cleanup'

#   # remove the default nginx configuration as it will tend
#   # to conflict with our configs.
#   before 'deploy:setup_config', 'nginx:remove_default_vhost'

#   # reload nginx to it will pick up any modified vhosts from
#   # setup_config
#   after 'deploy:setup_config', 'nginx:reload'

#   # Restart monit so it will pick up any monit configurations
#   # we've added
#   after 'deploy:setup_config', 'monit:restart'

#   # As of Capistrano 3.1, the `deploy:restart` task is not called
#   # automatically.
#   after 'deploy:publishing', 'deploy:restart'
# end

