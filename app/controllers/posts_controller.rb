class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post_counter = params[:post_counter]
  end

  def new
    @post = Post.new
  end

  def create
    current_user = User.find(params[:user_id])
    @post = current_user.posts.new(params.require(:post).permit(:title, :text).merge(user_id: current_user.id))
    if @post.save
      @post.update_user_posts_counter
      flash[:success] = 'Created New Post succesfully'
      redirect_to [:user_posts]
    else
      flash.now[:fail] = 'Failed to Create a New Post'
      redirect_to [:new_user_post]
    end
  end
end
