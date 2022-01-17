class User < ApplicationRecord
  has_many :posts
  has_many :comments, through: :posts
  has_many :likes, through: :posts

  def most_recent_posts
    User.posts.last(3)
  end
end
