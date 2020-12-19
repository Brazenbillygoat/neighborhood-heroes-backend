class Tournament < ApplicationRecord
  has_many :tasks
  has_many :competitions
  has_many :users, through: :competitions


end