FactoryGirl.define do
  factory :debt do
    title { Forgery('name').company_name }
    state "new"
    kind { Campaign::DEBT }
  end

end
