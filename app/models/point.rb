class Point < ActiveRecord::Base
  has_many :posts

  validates :name, presence: true, allow_blank: false
  validates_uniqueness_of :name, case_sensitive: false
  
end