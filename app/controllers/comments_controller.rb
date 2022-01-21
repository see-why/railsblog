class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(params.require(:comment).permit(:text).merge(post_id: post.id))
    if @comment.save
      flash[:alter] = 'Created New Comment succesfully'
    else
      flash.now[:notice] = 'Failed to Create a New Comment'
    end
    redirect_to [:user_post, { id: post.id.to_s }]
  end
end
