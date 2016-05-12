class AddUsersToSongSamples < ActiveRecord::Migration
  def up
    add_column :song_samples, :user_id, :integer
  end
  def down
    remove_column :song_samples, :user_id
  end
end
