class Post < ApplicationRecord
  has_many :likes, :comments
  belongs_to :users

  def update_user_posts_counter
    users.posts_counter += 1
  end

  def most_recent_comments
    comments.last(5)
  end
end
