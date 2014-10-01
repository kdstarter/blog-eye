
require 'nokogiri'
require 'open-uri'
require 'word_check'
include WordCheck

namespace :system do
  desc 'Renew max_notice_times everyday'
  task :renew_max_notice_times => :environment do
    redis = RedisClient.instance
    redis.set('max_notice_times', 0)
    Rails.logger.info "Renew max_notice_times as #{redis.get('max_notice_times')}"
  end

  desc 'Check landing page sensitive words'
  task :check_sensitive => :environment do
    message = ''
    pages = Settings.sensitive_pages

    pages.each do |page|
      doc = Nokogiri::HTML(open(page))
      words = doc.content.to_s
      sensitive_word = WordCheck.first_sensitive(words)

      if sensitive_word.present?
        message += "页面 #{page} 存在敏感词汇: #{sensitive_word}！"
      end
    end

    if message.present?
      send_to = Settings.site_mailer.admin_user

      redis = RedisClient.instance
      count_times = redis.incr('max_notice_times').to_i

      if count_times <= Settings.max_notice_times
        Rails.logger.info "#{count_times}th send mail to #{send_to} #{message.inspect}"
        SystemMailWorker.perform_async('sensitive_mail', send_to: send_to, content: message)
      else
        Rails.logger.warn "#{count_times}th not send mail to #{send_to} #{message.inspect}"
      end
    end
  end
end
