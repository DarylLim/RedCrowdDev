class RedCrowd::Investor::Campaign::Creator
  extend ActiveModel::Naming
  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attribute :amount_of_funding, Float
  attribute :kind, String
  attribute :title, String
  attribute :company_id, Integer

  validates :company_id, :kind, :title, presence: true
  validates :amount_of_funding, numericality: { greater_than_or_equal_to: 500 }

  def persisted?
    true
  end

  def save
    return false unless valid?
    campaign = ::Campaign.new(attributes)
    return false unless campaign.save!
    campaign
  end

end
