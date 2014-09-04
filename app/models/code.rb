class Code < ActiveRecord::Base
  belongs_to :user
  belongs_to :language
  belongs_to :category

  validates :title, presence: true, allow_blank: false
  validates :content, presence: true, allow_blank: false

end
