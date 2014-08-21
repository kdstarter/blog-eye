
require 'open-uri'
require 'file_size_validator' 

class User < ActiveRecord::Base

  extend FriendlyId
  friendly_id :uid, use: :finders

  mount_uploader :avatar, UserAvatarUploader

  has_many :posts, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :categories, dependent: :destroy

  before_create :update_ranking
  before_create :init_name, if: Proc.new { |u| u.name.blank? }
  after_create :init_avatar, if: Proc.new { |u| u.email =~ %r(@gmail.com$) }

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  validates :ranking, uniqueness: true
  validates :uid, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false

  validates_uniqueness_of :uid, case_sensitive: true
  validates_uniqueness_of :email, case_sensitive: false

  validates :avatar, file_size: { maximum: 1.megabytes.to_i }, on: [:update]#, if: Proc.new { |u| u.avatar_changed? }

  def human_name
    self.uid
  end

  def avatar_url
    self.avatar.url || self.avatar.default_url
  end

  def email_md5
    Digest::MD5.hexdigest(self.email.downcase)
  end

  def gravatar_url
    "http://www.gravatar.com/avatar/#{self.email_md5}" 
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["uid = :value OR email = :value", { value: login }]).first
    else
      where(conditions).first
    end
  end

  private
  def update_ranking
    current_ranking = User.maximum(:ranking).to_i
    self.ranking = current_ranking + 1
  end

  def init_name
    self.name = self.email.split('@').first
  end

  def init_avatar
    temp_url = "#{self.gravatar_url}?s=512"
    self.update_attributes(remote_avatar_url: temp_url)
  end
end
