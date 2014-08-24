# redis = Redis.new host: '127.0.0.1', port: 6379
redis = Redis.new
redis = Redis::Namespace.new('express:captcha', redis: redis)

SimpleCaptcha.setup do |sc|
  # Redis instance
  sc.redis = redis

  # expire time for redis
  sc.expire = 3600

  # default: 100x28
  sc.image_size = '160x30'

  # default: 5
  sc.length = 5

  # default: simply_blue
  # possible values:
  # 'embosed_silver',
  # 'simply_red',
  # 'simply_green',
  # 'simply_blue',
  # 'distorted_black',
  # 'all_black',
  # 'charcoal_grey',
  # 'almost_invisible'
  # 'random'
  sc.image_style = 'embosed_silver'

  # sc.add_image_style('mycaptha', [
  #     "-background '#F4F7F8'",
  #     "-fill '#86818B'",
  #     "-border 1",
  #     "-bordercolor '#E0E2E3'"])

  # default: low
  # possible values: 'low', 'medium', 'high', 'random'
  sc.distortion = 'medium'
end
