class Company < ActiveRecord::Base
  PENDING  = 'pending'
  APPROVED = 'approved'
  REJECTED = 'rejected'

  INDUSTRIES = %w(media retail transportation manufacturing finance healthcare service technology automotive real_estate education)

  scope :pending,  -> { where(status: PENDING) }
  scope :approved, -> { where(status: APPROVED) }
  scope :rejected, -> { where(status: REJECTED) }

  mount_uploader :logo, ::LogoUploader

  belongs_to :user
  has_many :rejection_reasons
  has_many :employees
  has_many :funding_histories

  validates :name, presence: true
  validates :industry, inclusion: INDUSTRIES

  
  before_validation :set_default_status

  accepts_nested_attributes_for :employees, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :funding_histories, :reject_if => lambda { |a| a[:kind].blank? }, :allow_destroy => true

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
