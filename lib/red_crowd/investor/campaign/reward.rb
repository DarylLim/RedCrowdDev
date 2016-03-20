class RedCrowd::Investor::Campaign::Reward
  include Virtus.model
  include ActiveModel::Validations

  attribute :campaign, Campaign  
  #...

  def save
    return false unless valid?
    #...
    true
  end
end
