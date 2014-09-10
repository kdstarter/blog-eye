
require "redis"

class RedisClient
  def self.instance
    @instance ||= Redis.new
  end
end
