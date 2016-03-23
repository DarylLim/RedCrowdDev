class RedCrowd::Admin::Campaign::Moderate
  include Virtus.model
  include ActiveModel::Validations

  attribute :approved, Boolean
  attribute :rejection_reason, String
  attribute :campaign, ::Campaign
  
  validates :rejection_reason, presence: true, unless: :approved

  def moderate!
    return false unless valid?
    if approved?
      @campaign.set_approved! 
    else
      ActiveRecord::Base.transaction do
        @campaign.set_rejected! and RejectionReason.create!(objective_id: campaign.id, objective_type: 'Campaign', content: rejection_reason)
      end
    end
  end

end
