class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :point
  belongs_to :category
  has_many :replies, dependent: :destroy

  validates :user_id, presence: true
  validates :point_id, presence: true
  validates :category_id, presence: true

  validates :source, presence: true
  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false

  SOURCES = ['原创或翻译', '转载或分享']

  default_scope { order('created_at desc') }

  before_save :validate_tags, :validate_sensitive?

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  private
  def validate_tags
    tags_str = self.tags.gsub(/，/, ',')

    if tags_str.split(',').size > 5
      errors.add(:tags, '关键词超过5个了')
      false
    else
      self.tags = tags_str
      true
    end
  end

  def validate_sensitive?
    Settings.sensitive_words.each do |word|
      if self.inspect.include?(word)
        errors.add(:base, "文章内容包含敏感词汇: #{word}")
        return false
      end
    end
  end
end
