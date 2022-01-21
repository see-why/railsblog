class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts).order(id: :desc)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
