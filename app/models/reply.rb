class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, allow_blank: false

  before_save :validate_sensitive

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  def validate_sensitive
    Settings.sensitive_words.each do |word|
      if self.inspect.include?(word)
        errors.add(:base, "回复内容包含敏感词汇: #{word}")
        return false
      end
    end
  end
end
