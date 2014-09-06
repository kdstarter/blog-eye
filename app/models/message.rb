class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :sender, class: User, foreign_key: :from_user_id
  belongs_to :target, polymorphic: true
  
  validates :user_id, presence: true
  validates :from_user_id, presence: true
  # validates :target, presence: true

end
