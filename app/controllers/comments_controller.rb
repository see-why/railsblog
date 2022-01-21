class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(params.require(:comment).permit(:text).merge(post_id: post.id))
    if @comment.save
      flash[:success] = 'Created New Comment succesfully'
    else
      flash.now[:fail] = 'Failed to Create a New Comment'
    end
    redirect_to [:user_post, { id: post.id.to_s }]
  end
end
