FactoryGirl.define do
  factory :equity do
    title { Forgery('name').company_name }
    state "new"

    kind { Campaign::EQUITY }
  end

end
