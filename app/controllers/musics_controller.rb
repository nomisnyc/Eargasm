class MusicsController < ApplicationController

  def index
    @musics = Music.order(:name)
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

  def bio
    @music = Music.find(params[:id])
  end

  def showhot
    @music = Music.find(params[:id])
    @songs = @music.topsongs
  end

  def artist_img
    @music = Music.find(params[:id])
  end

  def artist_event
    @music = Music.find(params[:id])
  end


  def create
    @music = Music.create(params[:music])
    id= YoutubeSearch.search(@music.name + @music.song_name).first['video_id']
    url= "http://youtube.com/embed/#{id}"
    @music.url = url
    @music.posted_by = @auth.name
    @music.save if @music.image_url.present?
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



