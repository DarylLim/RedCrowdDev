class FundingHistory < ActiveRecord::Base
  TYPES = %w(first second third)

  belongs_to :company

  validates :amount, :date, presence: true
  validates :kind, inclusion: TYPES
end
