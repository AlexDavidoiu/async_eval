class Post < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
end