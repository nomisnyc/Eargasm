class HomeController < ApplicationController

  def index
    @homes = Home.all
  end

  def show
    @home = Home.find(params[:id])
  end

  def new
    @home = Home.new
  end

  def edit
    @home = Home.find(params[:id])
  end


  def create
    @home = Home.create(params[:home])
    redirect_to(homes_path)
  end

  def update
    home = Home.find(params[:id])
    home.update_attributes(params[:home])
    redirect_to(home_path)
  end

  def destroy
    @home = Home.find(params[:id])
    @home.destroy
    redirect_to(home_path)

  end
end
