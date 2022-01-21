class User < ApplicationRecord
  validates :name, presence: true
  validates :bio, presence: true
  validates :posts_counter, numericality: { only_integer: true, greated_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def most_recent_posts
    posts.last(3)
  end
end
