FactoryGirl.define do
  factory :funding_history do
    kind FundingHistory::TYPES.first
    amount "MyString"
    association :company
    date { Forgery('date').date }
  end

end
