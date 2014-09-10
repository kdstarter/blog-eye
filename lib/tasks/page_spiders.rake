
require 'nokogiri'
require 'open-uri'
require 'word_check'
include WordCheck

namespace :page do
  desc 'Renew max_notice_times everyday'
  task :renew_max_notice_times => :environment do
    redis = RedisClient.instance
    redis.set('max_notice_times', Settings.max_notice_times)
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
      max_times = redis.get('max_notice_times').to_i
      if max_times > 0
        max_times -= 1
        redis.set('max_notice_times', max_times)

        Rails.logger.info "Send mail to #{send_to} #{message.inspect}"
        SystemMailer.delay.send_sensitive_mail(send_to, message)
      end
    end
  end
end
