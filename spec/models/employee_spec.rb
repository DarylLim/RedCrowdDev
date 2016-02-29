require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) { FactoryGirl.build(:employee) }

  it 'saves successfully if builds from FactoryGirl' do
    expect(employee.save!).to eq(true)
  end

  context 'invalid' do
    after(:each) do
      expect(employee.valid?).to eq(false)
    end

    it 'has blank name' do
      employee.name = nil
    end
  
    it 'has blank biography' do
      employee.biography = nil
    end

    it 'has blank position' do
      employee.position = nil
    end

  end

end
