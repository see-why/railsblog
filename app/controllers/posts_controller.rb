class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @post_counter = params[:post_counter]
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text).merge(author_id: current_user.id))
    @post.likes_counter = 0
    @post.comments_counter = 0
    if @post.save
      flash[:alert] = 'Created New Post succesfully'
      redirect_to [:user_posts]
    else
      flash.now[:notice] = 'Failed to Create a New Post'
      redirect_to [:new_user_post]
    end
  end
end
