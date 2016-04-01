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
  attribute :video_urls, String
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

  validate :check_video_urls

  def persisted?
    true
  end

  def save
    return false unless valid?
    campaign.update_attributes(attributes.except(:campaign))
    campaign
  end

  def check_video_urls
    if video_urls
      video_urls.each do |url|
        unless find_youtube_video(url)
          errors.add :video_urls, I18n.t('investor.campaign.reward.form.errors.wrong_video_urls')
        end
      end
    end
  end

  def find_youtube_video(url)
    url = url.gsub(/https?\:\/\/w?w?w?\.?/, '')
    url=~/youtube\.com\/embed\/([a-z0-9_\-]+)/i if url
    url=~/youtube\.com\/v\/([a-z0-9_\-]+)/i if url and $1.to_s.length==0
    url=~/youtube\.com\/watch.*?\?.*?v=([a-z0-9_\-]+)/i if url and $1.to_s.length==0
    url=~/youtu\.be\/([a-z0-9_\-]+)/i if url and $1.to_s.length==0
    $1.to_s.length!=0
  end

end
