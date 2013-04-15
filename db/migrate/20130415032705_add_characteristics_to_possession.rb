class AddCharacteristicsToPossession < ActiveRecord::Migration
  def change
  	add_column :possessions, :smart, :integer
  	add_column :possessions, :experiment, :integer
  	add_column :possessions, :hardwork, :integer
  	add_column :possessions, :teamwork, :integer
  end
end
