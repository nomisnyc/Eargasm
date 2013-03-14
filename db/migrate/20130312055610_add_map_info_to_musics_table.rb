class AddMapInfoToMusicsTable < ActiveRecord::Migration
  def change
    add_column :musics, :location, :string, :default => 'nyc'
    add_column :musics, :lng, :float
    add_column :musics, :lat, :float
    add_column :musics, :ven_name, :string
    add_column :musics, :ven_lat, :float
    add_column :musics, :ven_lng, :float
    add_column :musics, :time, :string
  end
end
