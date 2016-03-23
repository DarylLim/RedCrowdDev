require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:subject) { FactoryGirl.build(:campaign) }

  it 'saves successfully if builds from FactoryGirl' do
    expect(subject.save!).to eq(true)
  end

  context '#valid?' do
    it 'returns false if has incorrect kind' do
      subject.kind = 'incorrect'
      expect(subject.valid?).to eq(false)
    end
  end

  has_status_extention
end
