class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'

  after_save :update_user_posts_counter

  def update_user_posts_counter
    author.posts_counter += 1
  end

  def most_recent_comments
    comments.last(5)
  end
end
