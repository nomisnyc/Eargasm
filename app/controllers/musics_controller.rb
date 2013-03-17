class MusicsController < ApplicationController

  def counter
    @music = Music.find(params[:id])
    @music.rating += 1
    @music.save
    redirect_to(musics_path)
  end


  def index
    @musics = Music.order('rating DESC')
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
    @music = Music.create(params[:music])
    id= YoutubeSearch.search(@music.name + @music.song_name).first['video_id']
    url= "http://youtube.com/embed/#{id}"
    @music.url = url
    @music.save
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


