class Campaign < ActiveRecord::Base
  acts_as_taggable
  serialize :video_urls

  include Statusable

  EQUITY = 'equity'
  DEBT   = 'debt'
  REWARD = 'reward'
  TYPES = [REWARD, DEBT, EQUITY]

  mount_uploader :card_image, ::LogoUploader
  mount_uploader :facebook_shared_image, ::FacebookSharedImageUploader
  mount_uploader :pitch_image, ::PitchImageUploader

  has_many :rejection_reasons, as: :objective
  belongs_to :company

  validates :kind, inclusion: TYPES
end
