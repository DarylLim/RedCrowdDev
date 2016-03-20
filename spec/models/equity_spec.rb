require 'rails_helper'

RSpec.describe Equity, type: :model do
  let(:equity) { FactoryGirl.build(:equity) }

  it 'saves successfully if builds from FactoryGirl' do
    expect(equity.save!).to eq(true)
  end

  it 'has kind=equity by default' do
    expect(described_class.new.kind).to eq(Campaign::EQUITY)
  end

end
