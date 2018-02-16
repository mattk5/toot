class Toot < ApplicationRecord
  belongs_to :user
  has_many :comments

  default_scope -> { order(created_at: :desc) }

  validates :body, presence: true, uniqueness: true, length: {maximum: 280}
  validates :user_id, presence: true
end
