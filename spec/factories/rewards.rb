FactoryGirl.define do
  factory :reward do
    title { Forgery('name').company_name }
    state "new"

    kind { Campaign::REWARD }
    factory :approved_reward do
      status {Campaign::APPROVED}
    end
  end

end
