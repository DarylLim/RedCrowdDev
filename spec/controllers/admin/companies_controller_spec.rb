require 'rails_helper'

RSpec.describe Admin::CompaniesController, type: :controller do

  let(:new_company)      { FactoryGirl.create(:company) }
  let(:approved_company) { FactoryGirl.create(:approved_company) }

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
    Company.destroy_all
  end

  describe "GET #pending" do
    it "assigns all companies as @companies" do
      get :pending, {}, valid_session
      expect(assigns(:companies)).to eq([new_company])
    end
  end

  describe "GET #approved" do
    it "assigns all companies as @companies" do
      get :approved, {}, valid_session
      expect(assigns(:companies)).to eq([approved_company])
    end
  end

  describe "GET #moderate" do
    it 'render moderate view' do
      get :moderate, { id: new_company.id }
      expect(response).to render_template("moderate")
    end

    it 'assigns company as @company' do
      get :moderate, { id: new_company.id }
      expect(assigns(:company)).to eq(new_company)
    end

    it 'raise exception if try moderate approved company' do
      expect do
        get :moderate, { id: approved_company.id }
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "POST #submit" do
    context 'valid attributes' do
      context 'approved' do
        it 'change status for company as approved' do
          post :submit, {id: new_company.id, company: valid_attributes}, valid_session
          new_company.reload
          expect(new_company.status).to eq(Company::APPROVED)
        end

        it 'redirect to pending_companies_path' do
          post :submit, {id: new_company.id, company: valid_attributes}, valid_session
          expect(response).to redirect_to(pending_admin_companies_path)
        end
      end

      context 'rejected' do
        let(:valid_attributes) do
          {
            approved: false, 
            rejection_reason: 'incorrect name'
          }
        end

        it 'change status for company as rejected if params has approved=false rejected' do
          post :submit, {id: new_company.id, company: valid_attributes.merge(approved: false)}, valid_session
          new_company.reload
          expect(new_company.status).to eq(Company::REJECTED)
        end

        it 'create new rejection_reason record' do
          expect do
            post :submit, {id: new_company.id, company: valid_attributes.merge(approved: false)}, valid_session
          end.to change(RejectionReason, :count).by(1)
        end
      end
      
      it 'raise exception if try submit approved company' do
        expect do
          get :submit, { id: approved_company.id, company: valid_attributes }, valid_session
        end.to raise_error(ActiveRecord::RecordNotFound)
      end

    end

    context 'invalid attributes' do
      it 'render moderate view if approved false and rejection_reason is blank' do
        post :submit, { id: new_company.id, company: invalid_attributes }
        expect(response).to render_template("moderate")
      end
    end
  end

end
