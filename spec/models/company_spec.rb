require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:subject) { FactoryGirl.build(:company) }

  it 'saves successfully if build from FactoryGirl' do
    expect(subject.save!).to eq(true)
  end

  it 'saves successfully if build approved_company from FactoryGirl' do
    company = FactoryGirl.build(:approved_company)
    expect(subject.save!).to eq(true)
  end

  context 'invalid' do
    after(:each) do
      expect(subject.valid?).to eq(false)
    end

    it 'has blank name' do
      subject.name = nil
    end

    it 'has incorrect industry' do
      subject.industry = 'incorrect'
    end
  end

  has_status_extention

end
