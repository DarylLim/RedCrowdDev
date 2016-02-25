class Company < ActiveRecord::Base
  PENDING = 'pending'

  belongs_to :user

  validates :name, presence: true
  
  before_validation :set_default_status

  private
    def set_default_status
      self.status = PENDING if self.status.blank?
    end
end
