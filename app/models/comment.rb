class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, uniqueness: true, length: { maximum: 280 }
end
