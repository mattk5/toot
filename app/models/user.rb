class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :toots
  has_many :comments

  has_secure_password

  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, :email, :name, presence: true
  validates :name, length: { maximum: 100 }
  validates :username, length: { maximum: 60 }, uniqueness: true
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_FORMAT }, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 8 }

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
