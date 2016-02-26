FactoryGirl.define do
  factory :rejection_reason do
    content { Forgery('lorem_ipsum').paragraph }
    association :company
  end

end
