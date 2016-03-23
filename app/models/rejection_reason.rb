class RejectionReason < ActiveRecord::Base
  belongs_to :objective, polymorphic: true

  validates :objective, :content, presence: true
end
