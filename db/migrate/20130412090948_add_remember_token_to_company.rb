class AddRememberTokenToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :password, :string
  	add_column :companies, :password_confirmation, :string
  	add_column :companies, :remember_token, :string
  	add_index  :companies, :remember_token
  end
end
