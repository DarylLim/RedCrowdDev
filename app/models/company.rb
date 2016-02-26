class Company < ActiveRecord::Base
  PENDING  = 'pending'
  APPROVED = 'approved'
  REJECTED = 'rejected'

  scope :pending, -> { where(status: PENDING) }
  scope :approved, -> { where(status: APPROVED) }
  scope :rejected, -> { where(status: REJECTED) }

  belongs_to :user
  has_many :rejection_reasons

  validates :name, presence: true
  
  before_validation :set_default_status

  def set_approved!
    self.status = APPROVED
    self.save!  
  end

  def set_rejected!
    self.status = REJECTED
    self.save!  
  end

  private
    def set_default_status
      self.status = PENDING if self.status.blank?
    end
end
