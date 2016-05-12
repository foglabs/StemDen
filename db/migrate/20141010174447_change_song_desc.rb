class ChangeSongDesc < ActiveRecord::Migration
  def change
    rename_column :songs, :desc, :description
  end
end
