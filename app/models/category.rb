class Category < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :user_id, presence: true
  validates :name, presence: true, allow_blank: false
  validates_uniqueness_of :name, scope: :user_id, case_sensitive: false

end
