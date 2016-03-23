require 'rails_helper'

RSpec.describe RedCrowd::Admin::Campaign::Moderate do
  let(:subject) { described_class.new @attributes }
  let(:company)   { FactoryGirl.create(:company) }
  let(:campaign)  { FactoryGirl.create(:reward) }

  before(:each) do
    @attributes = {
      approved: true,
      campaign: campaign,
      rejection_reason: 'bla-bla'
    }
  end

  context '#moderate!' do
    it 'set status to approved if approved=true' do
      subject.moderate!
      campaign.reload
      expect(campaign.approved?).to eq(true)
    end

    context 'approved=false' do
      before(:each) do
        @attributes[:approved] = false
      end

      it 'set status to rejected if approved=false' do
        subject.moderate!
        campaign.reload
        expect(campaign.rejected?).to eq(true)
      end

      it 'create new RejectionReason if approved=false' do
        expect do
          subject.moderate!
        end.to change(RejectionReason, :count).by(1)
      end

      it 'return false if blank context and approved false' do
        @attributes[:rejection_reason] = ''
        expect(subject.moderate!).to eq(false)
        campaign.reload
        expect(campaign.pending?).to eq(true)
      end
    end
  end



end
