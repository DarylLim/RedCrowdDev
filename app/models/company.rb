class Company < ActiveRecord::Base
  include Statusable

  INDUSTRIES = %w(media retail transportation manufacturing finance healthcare service technology automotive real_estate education)

  
  mount_uploader :logo, ::LogoUploader

  belongs_to :user
  has_many :rejection_reasons, as: :objective

  has_many :employees
  has_many :funding_histories
  has_many :campaigns

  validates :name, presence: true
  validates :industry, inclusion: INDUSTRIES

  accepts_nested_attributes_for :employees, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :funding_histories, :reject_if => lambda { |a| a[:kind].blank? }, :allow_destroy => true

end
