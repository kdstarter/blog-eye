
env :PATH, ENV['PATH']

if ENV['_system_type'] = 'Darwin'
  set :environment, "development"
  set :job_template, "/bin/bash -l -c ':job'" # for development mode on mac os
else
  set :environment, "production"
  set :job_template, "/usr/local/bin/bash -l -c ':job'" # for production mode on linux
end

every 12.hours do
  rake "system:renew_max_notice_times"
end

every 30.minutes do
  rake "system:check_sensitive"
end
