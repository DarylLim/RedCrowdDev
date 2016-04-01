FactoryGirl.define do
  factory :campaign do
    title { Forgery('name').company_name }
    state "new"
    kind  { Campaign::TYPES.first }
    factory :approved_campaign do
      status {Campaign::APPROVED}
    end
  end
end
