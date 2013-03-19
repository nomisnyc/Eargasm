# == Schema Information
#
# Table name: musics
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  genre       :string(255)
#  song_name   :string(255)
#  url         :text
#  post_by     :string(255)
#  rating      :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  bio         :text
#  image_url   :text
#  location    :string(255)      default("nyc")
#  lng         :float
#  lat         :float
#  ven_name    :string(255)
#  ven_lat     :float
#  ven_lng     :float
#  time        :string(255)
#  description :text
#

class Music < ActiveRecord::Base
  attr_accessible :name, :song_name, :rating, :genre, :url, :post_by, :image_url, :bio, :location, :ven_name, :ven_lat, :ven_lng, :lat, :lng, :time, :description
  belongs_to :user, :inverse_of => :musics
  before_create :ratingstart
  before_save :categories
  before_save :info
 # before_save :geocode

  def categories
    api_key = 'DBBDMGNYLR3WRPCUX'
    url2 = "http://developer.echonest.com/api/v4/artist/images?api_key=#{api_key}&name=#{self.name.gsub(' ','+')}&format=json&results=4"
    response2= HTTParty.get(url2)['response']['images'][0]['url']
    self.image_url = response2
    url= "http://developer.echonest.com/api/v4/artist/biographies?api_key=#{api_key}&name=#{self.name.gsub(' ', '+')}&format=json&results=4"
    response = HTTParty.get(url)['response']
    bios = response['biographies'].map { |a| a['text']}
    largestbio = bios.group_by(&:size).max.last
    self.bio = largestbio.split("\r\n").join(" ")
  end

  def ratingstart
    self.rating = 0
  end

  def atrak
    YoutubeSearch.search(self.name).first(10).map{|i| {'title' => i['title'], 'video_id' => i['video_id'] }}
  end

  def info
    remote = Songkickr::Remote.new "1mwQluDndEhDhhJl"
    name = self.name

    if @auth.present?
      location = @auth.location
    else
      location = self.location
    end

    api = "1mwQluDndEhDhhJl"

    a = open("http://api.songkick.com/api/3.0/search/locations.json?query='#{location}'&apikey=#{api}").read

    l= JSON.parse(a)
    self.lng = l["resultsPage"]["results"]["location"].first["metroArea"]["lng"]
    self.lat = l["resultsPage"]["results"]["location"].first["metroArea"]["lat"]


    l_id = l['resultsPage']['results']['location'].first['metroArea']['id']

    sk_id = "sk:#{l_id}"

    event_results = remote.events(:artist_name => name, :location => sk_id, :min_date => "2013-03-10", :max_date => "2013-11-30").results

    if event_results.present?
        self.ven_name = event_results.first.venue.display_name
        self.time = event_results.first.start
        event_results.first.location

        self.ven_lat= event_results.first.location.lat
        self.ven_lng= event_results.first.location.lng
      end

  end

  def distance
      Geocoder::Calculations.distance_between([self.lat,self.lng], [self.ven_lat, self.ven_lng]).round(3)
  end



  # private
  # def geocode
  #   result = Geocoder.search(self.address).first

  #   if result.present?
  #     self.latitude = result.latitude
  #     self.longitude = result.longitude
  #   end
  # end
end
