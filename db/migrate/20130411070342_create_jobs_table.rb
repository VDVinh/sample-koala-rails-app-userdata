class CreateJobsTable < ActiveRecord::Migration
  def change
  	create_table :jobs do |t|
  		t.text    :description
  		t.integer :company_id
  		t.string  :position
  		t.integer :industry_id
	end
  end
end
