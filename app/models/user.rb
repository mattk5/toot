class User < ApplicationRecord
  has_many :toots
  has_many :comments

  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :username, :email, :name, presence: true
  validates :name, length: { maximum: 100 }
  validates :username, length: { maximum: 60 }, uniqueness: true
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_FORMAT }, uniqueness: {case_sensitive: false}
end
