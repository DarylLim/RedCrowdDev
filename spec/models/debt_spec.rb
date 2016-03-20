require 'rails_helper'

RSpec.describe Debt, type: :model do
  let(:debt) { FactoryGirl.build(:debt) }

  it 'saves successfully if builds from FactoryGirl' do
    expect(debt.save!).to eq(true)
  end

  it 'has kind=debt by default' do
    expect(described_class.new.kind).to eq(Campaign::DEBT)
  end

end
