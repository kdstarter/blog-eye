class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_one :blogger, through: :post, source: 'user'
  has_many :messages, as: :target, dependent: :destroy

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, allow_blank: false

  before_save :validate_sensitive
  after_create :message_to_blogger

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  private
  def message_to_blogger
    Message.create(
      is_read: false,
      target_id: self.id,
      target_type: self.class.to_s,
      user_id: self.blogger.id,
      from_user_id: self.user.id,
      body: self.content
      # body: "#{self.user.human_name} 评论了你的文章 #{self.post.title}"
    )
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
