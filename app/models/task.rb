class Task < ApplicationRecord
  belongs_to :tournament
  has_many :completed_tasks
  has_many :users, through: :completed_tasks


end