class AddSamplesSongsComments < ActiveRecord::Migration
  def change
    create_table(:samples) do |t|
      t.string :name, null: false
      t.string :filepath, null: false
      t.string :category, null: false
      t.integer :user_id, null: false

      t.string :desc
      t.integer :length
      t.timestamps
    end

    create_table(:songs) do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.timestamps
    end

    create_table(:song_samples) do |t|
      t.integer :song_id, null: false
      t.integer :sample_id, null: false
    end

    create_table(:comments) do |t|
      t.string :body, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
