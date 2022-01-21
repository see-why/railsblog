class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_save :update_post_likes_counter

  def update_post_likes_counter
    post.likes_counter = 0 if post.likes_counter.nil?
    post.likes_counter += 1
    post.save
  end
end
