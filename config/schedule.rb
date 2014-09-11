# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV['PATH']
set :environment, "production"
# set :environment, "development"

if ENV['_system_type'] = 'Darwin'
  set :job_template, "/bin/bash -l -c ':job'" # for mac os
else
  set :job_template, "/usr/local/bin/bash -l -c ':job'" # for linux
end

every 12.hours do
  rake "system:renew_max_notice_times"
end

every 30.minutes do
  rake "system:check_sensitive"
end
