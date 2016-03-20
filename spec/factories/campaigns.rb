FactoryGirl.define do
  factory :campaign do
    title { Forgery('name').company_name }
    state "new"
    kind  { Campaign::TYPES.first }
  end
end
