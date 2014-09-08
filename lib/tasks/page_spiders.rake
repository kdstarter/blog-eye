
require 'nokogiri'
require 'open-uri'
require 'word_check'
include WordCheck

namespace :page do
  desc 'Check landing page sensitive words'
  task :check_sensitive => :environment do
    uri = 'http://localhost:3000/'
    doc = Nokogiri::HTML(open(uri))
    words = doc.content.to_s

    sensitive_word = WordCheck.first_sensitive(words)
    if sensitive_word.present?
      puts "页面 #{uri} 存在敏感词汇: #{sensitive_word}！"
    end
  end
end
