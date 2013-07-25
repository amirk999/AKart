class AddUserIdToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :user_id, :Sinteger
  end
end
