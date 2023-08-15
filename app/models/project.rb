class Project < ApplicationRecord
  belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'
  has_many :bugs, dependent: :destroy
  has_many :user_projects
  has_many :developers, -> { where(user_type: 'developer') }, through: :user_projects, source: :user
  has_many :qas, -> { where(user_type: 'QA') }, through: :user_projects, source: :user
  validates :name, presence: true
end
