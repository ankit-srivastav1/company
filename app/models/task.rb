class Task < ApplicationRecord
  # has_dynamic_attributes

  belongs_to :project
  has_many :user_task
  has_many :users, through: :user_task
end
