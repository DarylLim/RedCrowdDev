class RedCrowd::Admin::Company::Moderate
  include Virtus.model
  include ActiveModel::Validations

  attribute :approved, Boolean
  attribute :rejection_reason, String
  attribute :company, Company  
  
  validates :rejection_reason, presence: true, unless: :approved

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

end
