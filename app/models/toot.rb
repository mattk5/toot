class Toot < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :author, :body, presence: true, uniqueness: true
  validates :body, length: { maximum: 280 }
end
