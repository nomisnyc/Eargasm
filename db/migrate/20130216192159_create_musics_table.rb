class CreateMusicsTable < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name
      t.string :genre
      t.string :song_name
      t.text :url
      t.string :post_by
      t.integer :rating
      t.timestamps
    end
  end
end
