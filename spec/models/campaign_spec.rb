require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:campaign) { FactoryGirl.build(:campaign) }

  it 'saves successfully if builds from FactoryGirl' do
    expect(campaign.save!).to eq(true)
  end

  context 'invalid' do
    it 'has incorrect kind' do
      campaign.kind = 'incorrect'
      expect(campaign.valid?).to eq(false)
    end
  end

end
