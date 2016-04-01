require 'rails_helper'

RSpec.describe Admin::RewardsController, type: :controller do

  let(:new_campaign)      { FactoryGirl.create(:reward) }
  let(:approved_campaign) { FactoryGirl.create(:approved_reward) }

  let(:valid_attributes) do
    {
      approved: true,
      rejection_reason: ''
    }
  end

  let(:invalid_attributes) do
    {
      approved: false,
      rejection_reason: ''
    }
  end

  let(:valid_session) { {} }

  login_admin

  before(:each) do
    Reward.destroy_all
  end

  describe "GET #pending" do
    it "assigns all campaigns as @campaigns" do
      get :pending, {}, valid_session
      expect(assigns(:campaigns)).to eq([new_campaign])
    end
  end

  describe "GET #approved" do
    it "assigns all campaigns as @campaigns" do
      get :approved, {}, valid_session
      expect(assigns(:campaigns)).to eq([approved_campaign])
    end
  end

  describe "GET #moderate" do
    it 'render moderate view' do
      get :moderate, { id: new_campaign.id }
      expect(response).to render_template("moderate")
    end

    it 'assigns campaign as @campaign' do
      get :moderate, { id: new_campaign.id }
      expect(assigns(:campaign)).to eq(new_campaign)
    end

    it 'raise exception if try moderate approved campaign' do
      expect do
        get :moderate, { id: approved_campaign.id }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "POST #submit" do
    context 'valid attributes' do
      context 'approved' do
        it 'change status for campaign as approved' do
          post :submit, {id: new_campaign.id, campaign: valid_attributes}, valid_session
          new_campaign.reload
          expect(new_campaign.status).to eq(Campaign::APPROVED)
        end

        it 'redirect to pending_campaigns_path' do
          post :submit, {id: new_campaign.id, campaign: valid_attributes}, valid_session
          expect(response).to redirect_to(pending_admin_rewards_path)
        end
      end

      context 'rejected' do
        let(:valid_attributes) do
          {
            approved: false,
            rejection_reason: 'incorrect name'
          }
        end

        it 'change status for campaign as rejected if params has approved=false rejected' do
          post :submit, {id: new_campaign.id, campaign: valid_attributes.merge(approved: false)}, valid_session
          new_campaign.reload
          expect(new_campaign.status).to eq(Campaign::REJECTED)
        end

        it 'create new rejection_reason record' do
          expect do
            post :submit, {id: new_campaign.id, campaign: valid_attributes.merge(approved: false)}, valid_session
          end.to change(RejectionReason, :count).by(1)
        end
      end

      it 'raise exception if try submit approved campaign' do
        expect do
          get :submit, { id: approved_campaign.id, campaign: valid_attributes }, valid_session
        end.to raise_error(ActiveRecord::RecordNotFound)
      end

    end

    context 'invalid attributes' do
      it 'render moderate view if approved false and rejection_reason is blank' do
        post :submit, { id: new_campaign.id, campaign: invalid_attributes }
        expect(response).to render_template("moderate")
      end
    end
  end

end
