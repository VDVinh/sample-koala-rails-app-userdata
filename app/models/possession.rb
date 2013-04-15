class Possession < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :job
  validates :user_id, presence: true
  validates :user_invited_id, presence: true
  validates :job_id, presence: true
end
