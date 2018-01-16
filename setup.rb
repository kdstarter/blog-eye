#!/usr/bin/env ruby
ROW_SIZE = 80
APP_NAME = "blog-eye"
RAILS_ENVS = %w(development test production)

class String
  COLORS = {
    :red => "\033[31m",
    :green => "\033[32m",
    :yellow => "\033[33m",
    :blue => "\033[34m"
  }
  def colorize(color)
    "#{COLORS[color]}#{self}\033[0m"
  end
end

def puts_section(info, &block)
  puts info
  puts "-"*ROW_SIZE
  yield block
  puts "-"*ROW_SIZE
  puts ""
end

def puts_line(info, &block)
  print info
  rsize = ROW_SIZE - info.length
  success = yield block
  if success == false
    puts "[Failed]".rjust(rsize).colorize(:red)
  else
    puts "[Done]".rjust(rsize).colorize(:green)
  end
end

puts "Now Installing #{APP_NAME}..."
puts "="*ROW_SIZE
puts ""

# Config environment
rails_env = RAILS_ENVS.first
puts_section "Configure" do
  print "Choose environment(default #{rails_env}):\n"
  print "0: #{RAILS_ENVS[0]}, 1: #{RAILS_ENVS[1]}, 2: #{RAILS_ENVS[2]} "
  env = gets.strip.to_i
  rails_env = RAILS_ENVS[env % RAILS_ENVS.length]
  puts "Selected environment: #{rails_env}"
end

puts_line "Install gems..." do
  `bundle install`
end

puts_line "Copy settings from sample files...\n" do
  `cp config/settings.yml.sample config/settings.yml`
  `cp config/database.yml.sample config/database.yml`
  `cp config/sensitive.yml.sample config/sensitive.yml`
  `cp config/oneapm.yml.sample config/oneapm.yml`
end

puts_line "Create databases...\n" do
  `RAILS_ENV=#{rails_env} bundle exec rake db:create`
  `RAILS_ENV=#{rails_env} bundle exec rake db:migrate`
  `RAILS_ENV=#{rails_env} bundle exec rake db:seed`

  if rails_env == "production"
    puts "Now running RAILS_ENV=#{rails_env} rake assets:precompile..."
    `RAILS_ENV=#{rails_env} rake assets:precompile`
  end
end

puts "\n#{APP_NAME} Successfully Installed."

