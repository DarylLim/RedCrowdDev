class RedCrowd::Admin::Company::Moderate
  include Virtus.model
  include ActiveModel::Validations

  attribute :approved, Boolean
  attribute :rejection_reason, String
  attribute :company, Company  
  
  validate :should_have_rejection_reason_if_does_not_approved

  def moderate!
    return false unless valid?
    if approved?
      @company.set_approved! 
    else
      ActiveRecord::Base.transaction do
        @company.set_rejected! and RejectionReason.create!(company: company, content: rejection_reason)
      end
    end
  end

  private
    def should_have_rejection_reason_if_does_not_approved
      return if approved?
      return if rejection_reason.present?
      errors.add(:company, :should_have_rejection_reason_if_does_not_approved)
    end
end
