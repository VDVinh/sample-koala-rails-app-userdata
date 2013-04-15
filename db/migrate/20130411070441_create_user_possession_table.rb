class CreateUserPossessionTable < ActiveRecord::Migration
  def change
  	create_table :possessions do |t|
  		t.integer :user_id
  		t.integer :job_id
  		t.integer :user_invited_id

  		t.timestamps
  	end
  end
end
