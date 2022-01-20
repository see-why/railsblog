class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_post_comments_counter

  def update_post_comments_counter
    post.comments_counter += 1
  end
end
