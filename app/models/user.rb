class User < ActiveRecord::Base

  has_many :posts
  has_many :replies
  has_many :categories

  before_create :update_ranking

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :uid, presence: true, allow_blank: false
  validates_uniqueness_of :uid, case_sensitive: false
  validates :ranking, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  private
  def update_ranking
    debugger
    current_ranking = User.maximum(:ranking).to_i
    self.ranking = current_ranking + 1
  end
end
