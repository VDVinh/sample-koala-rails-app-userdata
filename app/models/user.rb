class User < ActiveRecord::Base
	has_many :possessions, dependent: :destroy
	has_many :jobs, through: :possessions
end
