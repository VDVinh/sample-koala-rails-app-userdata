class AddColumnsToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :coins, :integer
  	add_column :users, :money, :integer
  end
end
