class AddBioAndImageUrlTable < ActiveRecord::Migration
  def change 
    add_column :musics, :bio, :text
    add_column :musics, :image_url, :text
  end
end
