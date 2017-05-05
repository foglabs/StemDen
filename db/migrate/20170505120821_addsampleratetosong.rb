class Addsampleratetosong < ActiveRecord::Migration
  def change
    add_column :songs, :srate, :integer
  end
end
