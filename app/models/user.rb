class User < ApplicationRecord
  has_many :user_task
  has_many :tasks, through: :user_task
  belongs_to :office

  has_many :project_user
  has_many :projects , through: :project_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
end
