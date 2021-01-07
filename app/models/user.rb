class User < ApplicationRecord
  has_many :completed_tasks
  has_many :tasks, through: :completed_tasks
  has_many :competitions
  has_many :tournaments, through: :competitions
  has_many :followers, foreign_key: :follower_id, class_name: "Relationship"
  has_many :followed, foreign_key: :followed_id, class_name: "Relationship"
  has_secure_password


end