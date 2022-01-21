class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user = post.author
    @comment = current_user.comments.new(params.require(:comment).permit(:text).merge(post_id: post.id))
    if @comment.save
      flash[:success] = 'Created New Post succesfully'
    else
      flash.now[:fail] = 'Failed to Create a New Comment'
    end
    redirect_to [:user_post, { id: post.id.to_s }]
  end
end
