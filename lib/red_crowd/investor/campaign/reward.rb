class RedCrowd::Investor::Campaign::Reward
  extend ActiveModel::Naming
  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attribute :campaign, ::Campaign
  # Basics
  attribute :tagline, String
  attribute :card_image, LogoUploader
  attribute :category, String
  attribute :tag_list, Array
  attribute :deadline, Integer
  # Story
  attribute :pitch, String
  attribute :pitch_image, PitchImageUploader
  attribute :video_url, String
  # Rewards
  # Funding
  attribute :funding_type, String
  # Extra
  attribute :custom_short_url, String
  attribute :facebook, String
  attribute :facebook_shared_image, FacebookSharedImageUploader
  attribute :twitter, String
  attribute :youtube, String
  attribute :website, String
  #...


  #TODO change it
  delegate :card_image, :pitch_image, :facebook_shared_image, to: :campaign

  def persisted?
    true
  end

  def save
    return false unless valid?
    campaign.update_attributes(attributes.except(:campaign, :video_url))
    campaign
  end

end
