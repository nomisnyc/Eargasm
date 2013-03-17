class SessionController < ApplicationController
  def new
  end

  def create
    @auth = User.where(:email => params[:email]).first
    if @auth && @auth.authenticate(params[:password])
      session[:user_id] = @auth.id
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
