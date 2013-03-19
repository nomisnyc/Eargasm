class AddPostedByToMusicsTable < ActiveRecord::Migration
  def change
    add_column :musics, :posted_by, :string
  end
end
