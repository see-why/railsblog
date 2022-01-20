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
end
