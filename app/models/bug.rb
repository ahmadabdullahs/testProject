class Bug < ApplicationRecord
  belongs_to :project

  belongs_to :user
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id'

  mount_uploader :screenshot, ScreenshotUploader
  validates :title, uniqueness: { scope: :project_id, message: "should be unique within the project" }
  validates :title, presence: true
  validates :deadline, presence:true
  validates :developer_id, presence:true
  

end
