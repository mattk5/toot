class Comment < ApplicationRecord
  belongs_to :commentable, polymophic: true 

  validates :body, presence: true, uniqueness: true, length: { maximum: 280 }
  validates :user_id, presence: true
  validates :toot_id, presence: true
end
