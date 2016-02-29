class Employee < ActiveRecord::Base
  mount_uploader :picture, EmployeePictureUploader

  belongs_to :company
  validates :name, :biography, :position, presence: true
end
