require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }
  
  it 'saves successfully user if is built from FactoryGirl' do
    expect(subject.save!).to eq(true)
    expect(subject.investor?).to eq(true)
  end

  it 'saves successfully admin' do
    admin =  FactoryGirl.build(:admin)
    expect(admin.save!).to eq(true)
    expect(admin.admin?).to eq(true)
  end

  context 'invalid' do
    it 'does not save if role is not correct' do
      subject.role = 'incorrect'
      expect(subject.save).to eq(false)
    end
  end

  context 'roles' do
    it 'admin?' do
      subject.role = 'admin'
      expect(subject.admin?).to eq(true)
    end

    it 'investor?' do
      subject.role = 'investor'
      expect(subject.investor?).to eq(true)
    end
  end
end
