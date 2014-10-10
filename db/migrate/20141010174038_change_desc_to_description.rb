class ChangeDescToDescription < ActiveRecord::Migration
  def change
    rename_column :samples, :desc, :description
  end
end
