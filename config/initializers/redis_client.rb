
require "redis"
require 'redis-namespace'

class RedisClient
  def self.instance
    @connection ||= Redis.new
    @instance ||= Redis::Namespace.new(:ns, :redis => @connection)
  end
end
