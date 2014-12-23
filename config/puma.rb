
pidfile "/tmp/blog-eye.pid"
state_path "/tmp/blog-eye.state"
daemonize true
workers 0
threads 0,8
bind 'tcp://0.0.0.0:8090'
environment 'production'
on_restart do
  puts 'Blog Eye on restart...'
end

preload_app!
