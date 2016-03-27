FactoryGirl.define do
  factory :rejection_reason do
    content { Forgery('lorem_ipsum').paragraph }
    after(:build) do |rr|
      rr.objective ||= FactoryGirl.create(:company)
    end
  end

end
