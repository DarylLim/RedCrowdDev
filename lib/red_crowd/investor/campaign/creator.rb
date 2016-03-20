class RedCrowd::Investor::Campaign::Creator
  include Virtus.model
  include ActiveModel::Validations

  attribute :amount_of_funding, Float
  attribute :kind, String
  attribute :title, String
  attribute :company, Company  

  validates :company, :kind, :title, presence: true
  validates :amount_of_funding, numericality: { greater_than_or_equal_to: 500 }

  def save
    return false unless valid?
    company.campaigns.create!(attributes.except(:company))
  end

end
