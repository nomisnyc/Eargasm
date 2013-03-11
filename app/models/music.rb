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
#

class Music < ActiveRecord::Base
  attr_accessible :name, :song_name, :rating, :genre, :url, :post_by
  belongs_to :user, :inverse_of => :musics
  before_create :ratingstart

  def ratingstart
    self.rating = 0
  end

  def atrak
    a= YoutubeSearch.search(self.name).first(10).map{|i| {'title' => i['title'], 'video_id' => i['video_id'] }}
  end

end
