module Statusable
  extend ActiveSupport::Concern

  PENDING  = 'pending'
  APPROVED = 'approved'
  REJECTED = 'rejected'

  included do
    scope :pending,  -> { where(status: PENDING) }
    scope :approved, -> { where(status: APPROVED) }
    scope :rejected, -> { where(status: REJECTED) }

    before_validation :set_default_status
  end

  [PENDING, APPROVED, REJECTED].each do |status_name|
    define_method "#{status_name}?" do
      self.status == status_name
    end

    define_method "set_#{status_name}!" do
      self.status = status_name and self.save!
    end
  end

  private
    def set_default_status
      self.status = PENDING if self.status.blank?
    end

end
