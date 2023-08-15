class User < ApplicationRecord
  has_many :bugs, foreign_key: 'user_id', class_name: "Bug"
  has_many :assigned_bugs, foreign_key: 'developer_id', class_name: "Bug"

  has_many :managed_projects, foreign_key: "manager_id", class_name: "Project", dependent: :destroy

  has_many :user_projects
  has_many :projects, through: :user_projects

  validates :name, presence: true
  validates :user_type, presence: true
  enum :user_type, { manager: "Manager", developer: "Developer", qa: "QA" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
