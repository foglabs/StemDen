class ChangeNewsTopicName < ActiveRecord::Migration
  def up
    remove_column :topics, :type
    add_column :topics, :post_type, :string
  end

  def down
    add_column :topics, :type, :string
    remove_column :topics, :post_type
  end
end
