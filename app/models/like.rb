class Like < ApplicationRecord
  belongs_to :posts, :users

  def update_post_likes_counter
    posts.likes_counter += 1
  end
end
