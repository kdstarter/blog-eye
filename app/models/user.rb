require 'file_size_validator' 
class User < ActiveRecord::Base

  mount_uploader :avatar, UserAvatarUploader

  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :categories, dependent: :destroy

  before_create :update_ranking
  before_create :set_default_name, if: Proc.new { |u| u.name.blank? }

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

  validates :avatar, presence: true, file_size: { 
    minimum: 3.kilobytes.to_i, maximum: 1.megabytes.to_i } 

  def avatar_url
    self.avatar.url
  end

  def email_md5
    Digest::MD5.hexdigest(self.email.downcase)
  end

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

  def set_default_name
    self.name = self.email.split('@').first
  end
end
