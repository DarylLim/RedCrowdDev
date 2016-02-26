FactoryGirl.define do
  factory :company do
    name   { Forgery('name').company_name  }
    status { Company::PENDING }

    factory :approved_company do
      status { Company::APPROVED }  
    end
  end

end
