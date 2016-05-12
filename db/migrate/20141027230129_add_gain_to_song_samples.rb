class AddGainToSongSamples < ActiveRecord::Migration
  def up
    add_column :song_samples, :gain, :decimal
  end

  def down
    remove_column :song_samples, :gain
  end
end
