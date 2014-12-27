
require 'word_check'
include WordCheck::Worker

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
  STATUSES = ['隐藏', '显示']

  default_scope { order('created_at desc') }
  scope :visible, -> { where(status: 1) }

  before_save :validate_tags, :validate_sensitive?

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  def text_for_status
    "已#{Post::STATUSES[status.to_i]}"
  end

  private
  def validate_tags
    self.tags.gsub!(/，/, ',')
    if self.tags.split(',').size > 5
      errors.add(:tags, '关键词超过5个了')
      false
    end
  end

  def validate_sensitive?
    word = WordCheck::Worker.first_sensitive(self.inspect)
    if word.present?
      errors.add(:base, "文章内容包含敏感词汇: #{word}")
      return false
    end
  end
end
