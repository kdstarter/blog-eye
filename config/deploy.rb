# frozen_string_literal: true
# config valid only for current version of Capistrano
lock '3.7.0'

set :application, 'blog-eye'
set :repo_url, "git@github.com:agilejzl/blog-eye.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
ask :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, false

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/settings.yml', 'config/database.yml', 'config/sensitive.yml', 'config/puma.rb')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :puma_init_active_record, true
# Puma config file
set :puma_conf, "#{shared_path}/config/puma.rb"

set :rvm_binary, '~/.rvm/bin/rvm'
set :rvm_ruby_version, 'default'

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'Some commands before publishing'
  task :rake_commands do
    on roles(:db), in: :groups, wait: 3 do
      within release_path do
        execute :rake, 'system:renew_max_notice_times RAILS_ENV=production'
      end
    end
  end

  desc 'Restart the application'
  task :restart do
    on roles(:app) do
      execute "cd #{deploy_to}/current && #{fetch(:rvm_binary)} #{fetch(:rvm_ruby_version)} do bundle exec pumactl -S #{shared_path}/tmp/pids/puma.state restart"
    end
  end

  before :publishing, :rake_commands
end

after :deploy, 'deploy:restart'

