class Project < ApplicationRecord
  belongs_to :office
  has_many :tasks
  has_many :project_user
  has_many :users, through: :project_user
end
