class AddRolesToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :roles_mask, :integer
  	add_column :users, :roles, :integer
  end
end
