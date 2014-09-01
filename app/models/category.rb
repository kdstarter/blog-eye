class Category < ActiveRecord::Base

  # extend FriendlyId
  # friendly_id :name, use: :finders

  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true, allow_blank: false
  validates_uniqueness_of :name, scope: :user_id, case_sensitive: false

  def created_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end
end
