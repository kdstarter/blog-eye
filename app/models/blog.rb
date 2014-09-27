class Blog < ActiveRecord::Base

  scope :visible, -> { where(status: 1) }

  validates :title, presence: true
  validates :content, presence: true

  STATUSES = ['隐藏', '显示']
  CATEGORIES = ['通知', '功能']

  default_scope { order('created_at desc') }

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  def type
    Blog::CATEGORIES[self.category]
  end
end
