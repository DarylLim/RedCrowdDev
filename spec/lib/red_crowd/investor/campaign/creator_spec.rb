require 'rails_helper'

RSpec.describe RedCrowd::Investor::Campaign::Creator do
  let(:subject) { described_class.new @attributes }
  let(:company) { FactoryGirl.create(:company) }
  let(:valid_attributes) do
    {
      title: 'Title',
      amount_of_funding: 500,
      company_id: company.id,
      kind: Campaign::REWARD,
    }
  end

  let(:invalid_attributes) do
    {
      title: '',
      amount_of_funding: 0,
      company_id: nil,
      kind: 'invalid_type'
    }
  end


  before(:each) do
    @attributes = valid_attributes
  end

  context 'save method' do
    context 'valid_attributes' do
      it 'returns true' do
        expect(subject.save.class).to eq(Campaign)
      end

      it 'adds new record to campaign' do
        expect do
          subject.save
        end.to change(Campaign, :count).by(1)
      end

    end

    context 'invalid_attributes' do
      before(:each) do
        @attributes = invalid_attributes
      end

      it 'returns false' do
        expect(subject.save).to eq(false)
      end

      it 'does not add new record to campaign' do
        expect do
          subject.save
        end.to change(Campaign, :count).by(0)
      end

      it 'returns false if amount_of_funding less than 500' do
        @attributes = valid_attributes.merge(amount_of_funding: 499)
        expect(subject.save).to eq(false)
      end

    end

  end

end

