class Comment < ApplicationRecord
  belongs_to :posts

  def update_post_comments_counter
    posts.comments_counter += 1
  end
end
