class AddCategoryToSongs < ActiveRecord::Migration
  def up
    add_column :songs, :category, :string
    add_column :songs, :desc, :string
  end

  def down
    remove_column :songs, :category
    remove_column :songs, :desc
  end
end
