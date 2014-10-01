
class QiniuWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1
  sidekiq_options queue: :qiniu

  def perform(type, params)
    self.send(type, params)
  end

  def update_user_avatar(params)
    user = User.find(params["user_id"])
    temp_url = "#{user.gravatar_url}?s=512"
    user.update_attributes(remote_avatar_url: temp_url)
  end
end
