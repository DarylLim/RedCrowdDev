class Company < ActiveRecord::Base
  PENDING  = 'pending'
  APPROVED = 'approved'
  REJECTED = 'rejected'

  scope :pending, -> { where(status: PENDING) }
  scope :approved, -> { where(status: APPROVED) }
  scope :rejected, -> { where(status: REJECTED) }

  mount_uploader :logo, ::LogoUploader

  belongs_to :user
  has_many :rejection_reasons
  has_many :employees

  validates :name, presence: true
  
  before_validation :set_default_status

  accepts_nested_attributes_for :employees, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  def pending?
    self.status == PENDING
  end
  
  def approved?
    self.status == APPROVED
  end

  def rejected?
    self.status == REJECTED
  end

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
