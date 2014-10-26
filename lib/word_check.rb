
module WordCheck
  module Worker
    def first_sensitive(str)
      # firstly strip any none Chinese character
      str.gsub!(/[^\u4e00-\u9fa5]/, '')

      Settings.sensitive_words.each do |word|
        return word if str.include?(word)
      end
      nil
    end
  end
end
