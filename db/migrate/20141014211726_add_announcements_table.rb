class AddAnnouncementsTable < ActiveRecord::Migration
  def up
    add_column :topics, :type, :string
  end

  def down
    remove_column :topics, :type
  end
end
