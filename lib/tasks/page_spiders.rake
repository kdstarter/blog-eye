
require 'nokogiri'
require 'open-uri'
require 'word_check'
include WordCheck

namespace :page do
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
      puts "Send mail to #{send_to} #{message.inspect}"
      SystemMailer.delay.send_sensitive_mail(send_to, message)
    end
  end
end
