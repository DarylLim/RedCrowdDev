require 'rails_helper'

RSpec.describe Reward, type: :model do
  let(:reward) { FactoryGirl.build(:reward) }

  it 'saves successfully if builds from FactoryGirl' do
    expect(reward.save!).to eq(true)
  end

  it 'has kind=reward by default' do
    expect(described_class.new.kind).to eq(Campaign::REWARD)
  end

end
