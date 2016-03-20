class Campaign < ActiveRecord::Base
  EQUITY = 'equity'
  DEBT   = 'debt'
  REWARD = 'reward'
  TYPES = [REWARD, DEBT, EQUITY]

  validates :kind, inclusion: TYPES
end
