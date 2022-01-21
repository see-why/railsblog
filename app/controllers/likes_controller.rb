class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user = post.author
    @like = current_user.likes.new(post_id: post.id)
    if @like.save
      flash[:success] = 'Added new like'
    else
      flash.now[:fail] = 'Failed to add new like'
    end
    redirect_to [:user_post, { id: post.id.to_s, user_id: current_user.id.to_s }]
  end
end
