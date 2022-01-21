class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_post_comments_counter

  def update_post_comments_counter
    post.comments_counter = 0 if post.comments_counter.nil?
    post.comments_counter += 1
    post.save
  end
end
