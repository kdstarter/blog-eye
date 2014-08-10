class User < ActiveRecord::Base

  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :categories, dependent: :destroy

  before_create :update_ranking

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  validates :ranking, uniqueness: true
  validates :uid, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false

  validates_uniqueness_of :uid, case_sensitive: false
  validates_uniqueness_of :email, case_sensitive: false

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(uid) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      where(conditions).first
    end
  end

  private
  def update_ranking
    current_ranking = User.maximum(:ranking).to_i
    self.ranking = current_ranking + 1
  end
end
