class Reply < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :post

  has_one :blogger, through: :post, source: 'user'
  has_many :messages, as: :target, dependent: :destroy

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :content, presence: true, allow_blank: false

  default_scope { order('created_at desc') }

  before_save :validate_sensitive
  after_create :message_to_blogger, if: Proc.new { |r| r.blogger.id != self.user.id }

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  private
  def message_to_blogger
    message = self.messages.build(
      is_read: false,
      user_id: self.blogger.id,
      from_user_id: self.user.id,
      body: self.content
    )
    message.save
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
