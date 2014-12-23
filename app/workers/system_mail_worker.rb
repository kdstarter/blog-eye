
class SystemMailWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3
  sidekiq_options queue: :mailer

  def perform(type, params)
    SystemMailer.send(type, params).deliver
  end
end
