class AddDescriptionToPossession < ActiveRecord::Migration
  def change
  	add_column :possessions, :description, :text
  end
end
