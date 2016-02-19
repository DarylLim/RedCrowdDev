require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }
  it 'saves successfully if is built from FactoryGirl' do
    expect(subject.save!).to eq(true)
  end
end
