require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { FactoryGirl.build(:company) }

  it 'saves successfully if build from FactoryGirl' do
    expect(company.save!).to eq(true)
  end

  it 'saves successfully if build approved_company from FactoryGirl' do
    company = FactoryGirl.build(:approved_company)
    expect(company.save!).to eq(true)
  end

  context 'status' do
    it 'has pending status by default' do
      company.status = nil
      company.save!
      expect(company.status).to eq(Company::PENDING)
    end
  end

  context 'invalid' do
    after(:each) do
      expect(company.valid?).to eq(false)
    end

    it 'has blank name' do
      company.name = nil
    end
  end

  it 'has method set_approved!' do
    company.set_approved!
    expect(company.status).to eq(Company::APPROVED)
  end

  it 'has method set_rejected!' do
    company.set_rejected!
    expect(company.status).to eq(Company::REJECTED)
  end

end
