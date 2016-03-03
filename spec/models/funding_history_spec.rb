require 'rails_helper'

RSpec.describe FundingHistory, type: :model do
  let(:subject) { FactoryGirl.build(:funding_history) }

  it 'saves successfully if builds from FactoryGirl' do
    expect(subject.save!).to eq(true)
  end

  context 'invalid' do
    after(:each) do
      expect(subject.save).to eq(false)
    end

    it 'has blank kind' do
      subject.kind = nil
    end

    it 'has incorrect kind' do
      subject.kind = 'incorrect'
    end

    it 'has blank amount' do
      subject.amount = nil
    end

    it 'has blank date' do
      subject.date = nil
    end
  end

end
