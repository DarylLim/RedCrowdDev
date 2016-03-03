class FundingHistory < ActiveRecord::Base
  TYPES = %w(self_funded seed_round pre_a_round series_a series_b series_c start_up_capital growth_capital credit_facility bank_loan shareholder_load)

  belongs_to :company

  validates :amount, :date, presence: true
  validates :kind, inclusion: TYPES
end
