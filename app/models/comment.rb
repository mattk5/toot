class Comment < ApplicationRecord
  belongs_to :toot
  belongs_to :user

  validates :author, :body, presence: true, uniqueness: true
  validates :body, length: { maximum: 240 }
  validates :user_id, presence: true
  validates :toot_id, presence: true 
end
