class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end
  def new
    @user = User.new
  end
  def create
    User.create(params[:user])
    redirect_to(root_path)
  end
  def edit
    @user = User.find(params[:id])
  end
end
