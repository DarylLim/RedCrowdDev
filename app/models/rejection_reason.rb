class RejectionReason < ActiveRecord::Base
  belongs_to :company

  validates :company, :content, presence: true
end
