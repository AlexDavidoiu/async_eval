class Like < ApplicationRecord
  validates :user, uniqueness: { scope: :post_id, message: "has already liked the post" }

  belongs_to :user
  belongs_to :post
end