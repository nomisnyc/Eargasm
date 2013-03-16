class SessionController < ApplicationController
  def new
  end

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
