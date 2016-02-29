FactoryGirl.define do
  factory :employee do
    name      { Forgery('name').full_name    }
    position  { Forgery('lorem_ipsum').sentence  }
    biography { Forgery('lorem_ipsum').paragraph }


    after(:build) do |employee|
      File.open("#{::Rails.root}/spec/fixtures/files/img.jpeg") do |f|
        employee.picture = f
      end

    end
  end

end
