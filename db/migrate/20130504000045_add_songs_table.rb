class AddSongsTable < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.text :description
      t.string :song_ident
      t.integer :music_id
      t.timestamps
    end
  end

end

