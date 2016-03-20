FactoryGirl.define do
  factory :reward do
    title { Forgery('name').company_name }
    state "new"

    kind { Campaign::REWARD }
  end

end
