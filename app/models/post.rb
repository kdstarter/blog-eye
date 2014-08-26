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

  def published_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

end
