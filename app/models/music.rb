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
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Music < ActiveRecord::Base
  attr_accessible :name, :song_name, :rating, :genre, :url, :post_by
  before_create :ratingstart

  def ratingstart
    self.rating = 0
  end



end
