class MusicsController < ApplicationController

  def index
    @musics = Music.all
  end

  def show
    @music = Music.find(params[:id])

  end

  def new
    @music = Music.new

  end

  def edit
    @music = Music.find(params[:id])
  end

  def create
    music = Music.create(params[:music])
    redirect_to(musics_path)

  end

  def update
    music = Music.find(params[:id])
    music.update_attributes(params[:music])
    redirect_to(music_path)
  end

  def destroy
    music = Music.find(params[:id])
    music.delete
    redirect_to(musics_path)

  end
end
