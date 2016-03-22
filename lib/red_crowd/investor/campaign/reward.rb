class RedCrowd::Investor::Campaign::Reward
  extend ActiveModel::Naming
  include Virtus.model
  include ActiveModel::Validations
  include ActiveModel::Conversion

  attribute :campaign, ::Campaign
  attribute :title, String
  # Basics
  attribute :tagline, String
  attribute :card_image, String
  attribute :category, String
  attribute :tags, String
  attribute :deadline, DateTime
  # Story
  attribute :pitch
  attribute :pitch_image
  attribute :video_url
  # Rewards
  # Funding
  attribute :funding_type
  # Extra
  attribute :custom_short_url
  attribute :facebook
  attribute :twitter
  attribute :youtube
  attribute :website
  #...

  def save
    return false unless valid?
    #...
    true
  end
end
