class AddCategoryToSongs < ActiveRecord::Migration
  def up
    add_column :songs, :category, :string
  end

  def down
    remove_column :songs, :category
  end
end
