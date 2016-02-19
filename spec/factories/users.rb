FactoryGirl.define do
  factory :user do
    email { Forgery(:internet).email_address }
    password '11223344'
    password_confirmation '11223344'
  end
end
