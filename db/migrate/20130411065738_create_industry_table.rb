class CreateIndustryTable < ActiveRecord::Migration
  def change
  	create_table :industries do |t|
  		t.string :name
  		t.text :description
  		
  	end
  end
end
