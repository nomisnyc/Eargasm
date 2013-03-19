class AddDescriptionToMusicsTable < ActiveRecord::Migration
  def change
    add_column :musics, :description, :text
  end
end
