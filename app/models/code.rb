class Code < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :category

  validates :user_id, presence: true
  validates :language_id, presence: true
  validates :category_id, presence: true

  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false

  default_scope { order('created_at desc') }

  before_save :validate_tags

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  private
  def validate_tags
    self.tags.gsub!(/，/, ',')
    if self.tags.split(',').size > 3
      errors.add(:tags, '关键词超过3个了')
      false
    end
  end
end
