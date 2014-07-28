class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users,  :integer
  end
end
