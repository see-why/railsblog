class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greated_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greated_than_or_equal_to: 0 }

  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  after_create :update_user_posts_counter

  def update_user_posts_counter
    author.posts_counter = 0 if author.posts_counter.nil?
    author.posts_counter += 1
    author.save
  end

  def most_recent_comments
    comments.last(5)
  end
end
