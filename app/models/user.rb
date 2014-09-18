# encoding: utf-8
require 'open-uri'
require 'file_size_validator' 

class User < ActiveRecord::Base

  extend FriendlyId
  friendly_id :uid, use: :finders

  mount_uploader :avatar, UserAvatarUploader

  has_many :messages, dependent: :destroy, foreign_key: :user_id
  has_many :posts, dependent: :destroy
  has_many :codes, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :categories, dependent: :destroy

  before_create :update_ranking
  before_create :init_name, if: Proc.new { |u| u.name.blank? }
  after_create :create_default_category
  after_create :send_welcome_mail
  after_create :init_avatar#, if: Proc.new { |u| u.email =~ %r(@gmail.com\z) }

  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :async,
         authentication_keys: [:login]

  validates :ranking, uniqueness: true
  validates :avatar, file_size: { maximum: 1.megabytes.to_i }, on: [:update]#, if: Proc.new { |u| u.avatar_changed? }

  validates :uid, presence: true, allow_blank: false, uniqueness: { case_sensitive: true },
            length: { minimum: 3, maximum: 24 }, exclusion: { in: Settings.exclusions },
            format: { with: /\A([a-zA-Z0-9])([\w|-]+)([a-zA-Z0-9])\z/, message: '是无效的，必须以字母或数字开头和结尾，可包含 "-" 或 "_"' }

  validates :email, presence: true, allow_blank: false, uniqueness: { case_sensitive: false },
            format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i, message: 'Email格式不正确' }

  def human_name
    self.uid
  end

  def whose_blogger
    "#{self.uid} 的博客"
  end

  def created_time
    self.created_at.strftime('%Y-%m-%d %H:%M')
  end

  def github_page
    "https://github.com/#{self.github}"
  end

  def city
    self.city_name.blank? ? '未知' : self.city_name
  end

  def blogger_title
    self.signature.blank? ? "#{self.whose_blogger}" : self.signature
  end

  def avatar_url(version=nil)
    if version.present? && self.avatar.versions.keys.include?(version.to_sym)
      self.avatar.send(version).url || self.avatar.default_url
    else
      self.avatar.url || self.avatar.default_url
    end
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
    self.name = self.uid
  end

  def send_welcome_mail
    SystemMailer.delay.send_welcome_mail(self.email)
  end

  def init_avatar
    return if self.avatar.present?
    temp_url = "#{self.gravatar_url}?s=512"
    self.update_attributes(remote_avatar_url: temp_url)
  end
  handle_asynchronously :init_avatar, queue: 'init_avatar', priority: 20, run_at: Proc.new { 0.1.seconds.from_now }

  def create_default_category
    category = self.categories.build(name: '我的文章', description: '默认文章分类')
    category.save
  end
end
