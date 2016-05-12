class AddSampleIdToComments < ActiveRecord::Migration
  def up
    add_column :comments, :sample_id, :integer
  end

  def down
    remove_column :comments, :sample_id
  end
end
