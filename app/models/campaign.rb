class Campaign < ActiveRecord::Base
  include Statusable


  EQUITY = 'equity'
  DEBT   = 'debt'
  REWARD = 'reward'
  TYPES = [REWARD, DEBT, EQUITY]

  has_many :rejection_reasons, as: :objective

  validates :kind, inclusion: TYPES
end
