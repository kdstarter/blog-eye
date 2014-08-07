#!/usr/bin/env ruby
ROW_SIZE = 80
APP_NAME = "ruby-eye"

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
rails_env = "development"
puts_section "Configure" do
  print "Choose environment(default development):"
  env = gets.strip
  if %w(production development test).include?(env)
    rails_env = env
  end
  puts "RAILS_ENV: #{rails_env}"
end

puts_line "Install gems..." do
  `bundle install`
end

puts_line "Create databases...\n" do
  `cp config/secrets.yml.sample config/secrets.yml`
  `cp config/database.yml.sample config/database.yml`

  `RAILS_ENV=#{rails_env} bundle exec rake db:create`
  `RAILS_ENV=#{rails_env} bundle exec rake db:migrate`
  # unless rails_env == "test"
  #   `RAILS_ENV=#{rails_env} bundle exec rake db:seed`
  # end
end

puts "\n#{APP_NAME} Successfully Installed."

