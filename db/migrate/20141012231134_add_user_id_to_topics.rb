class AddUserIdToTopics < ActiveRecord::Migration
  def up
    add_column :topics, :user_id, :integer
  end

  def down
    remove_column :topics, :user_id
  end
end
