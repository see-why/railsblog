class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @userid = params[:u_id]
    @like = current_user.likes.new(post_id: post.id)
    if @like.save
      flash[:alert] = 'Added new like'
    else
      flash.now[:notice] = 'Failed to add new like'
    end
    redirect_to [:user_post, { id: post.id.to_s, user_id: @userid }]
  end
end
