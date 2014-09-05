class Language < ActiveRecord::Base
  has_many :user_codes, dependent: :destroy, class: Code

  validates :name, presence: true, allow_blank: false
  validates :code, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }
  
end
