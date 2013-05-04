# == Schema Information
#
# Table name: songs
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  song_ident  :string(255)
#  music_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#



class Song < ActiveRecord::Base
  attr_accessible :title, :description, :song_ident, :music_id
   belongs_to :music
end
