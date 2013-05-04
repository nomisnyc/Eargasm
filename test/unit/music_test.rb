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
#  posted_by   :string(255)
#

require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
