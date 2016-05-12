class AddRoleToUsers < ActiveRecord::Migration
  def up
    add_column :users, :role, :string, null: false, default: "gardener"
  end

  def down
    remove_column :users, :role
  end
end
