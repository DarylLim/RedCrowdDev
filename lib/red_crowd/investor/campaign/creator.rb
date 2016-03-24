class RedCrowd::Investor::Campaign::Creator
  extend ActiveModel::Naming
  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attribute :amount_of_funding, Float
  attribute :kind, String
  attribute :title, String
  attribute :company_id, Integer

  validates :company_id, presence: { message: I18n.t('forms.campaign.creator.errors.blank_company_id') }
  validates :kind, presence: { message: I18n.t('forms.campaign.creator.errors.blank_kind') }
  validates :title, presence: { message: I18n.t('forms.campaign.creator.errors.blank_title') }
  validates :amount_of_funding, numericality: { greater_than_or_equal_to: 500, message: I18n.t('forms.campaign.creator.errors.wrong_amount_of_funding') }

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
