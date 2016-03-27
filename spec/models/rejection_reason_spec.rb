require 'rails_helper'

RSpec.describe RejectionReason, type: :model do
  let(:rejection_reason) { FactoryGirl.build(:rejection_reason) }

  it 'successfully saves if build from FactoryGirl' do
    expect(rejection_reason.save!).to eq(true)
  end

  context 'invalid' do
    after(:each) do
      expect(rejection_reason.save).to eq(false)    
    end

    it 'has blank content' do
      rejection_reason.content = nil
    end

    it 'has blank objective' do
      rejection_reason.objective = nil
    end
  end
  
end
