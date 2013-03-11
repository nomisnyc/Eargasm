# == Schema Information
#
# Table name: musics
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  genre      :string(255)
#  song_name  :string(255)
#  url        :text
#  post_by    :string(255)
#  rating     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  bio        :text
#  image_url  :text
#

class Music < ActiveRecord::Base
  attr_accessible :name, :song_name, :rating, :genre, :url, :post_by, :image_url, :bio
  belongs_to :user, :inverse_of => :musics
  before_create :ratingstart
  before_save :categories
 # before_save :geocode

  def categories
    api_key = 'DBBDMGNYLR3WRPCUX'
    self.name = self.name.gsub(' ', '+')
    url2 = "http://developer.echonest.com/api/v4/artist/images?api_key=#{api_key}&name=#{self.name}&format=json&results=4"
    response2= HTTParty.get(url2)['response']['images'][0]['url']
    
    self.image_url = response2

    url= "http://developer.echonest.com/api/v4/artist/biographies?api_key=#{api_key}&name=#{self.name}&format=json&results=4"

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

  # private
  # def geocode
  #   result = Geocoder.search(self.address).first

  #   if result.present?
  #     self.latitude = result.latitude
  #     self.longitude = result.longitude
  #   end
  # end
end
