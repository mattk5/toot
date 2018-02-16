class Toot < ApplicationRecord
  belongs_to :user
  has_many :comments

  default_scope -> { order(created_at: :desc) }

  validates :author, :body, presence: true, uniqueness: true
  validates :body, length: { maximum: 280 }
  validates :user_id, presence: true
end
