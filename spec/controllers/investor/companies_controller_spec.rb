require 'rails_helper'

RSpec.describe Investor::CompaniesController, type: :controller do

  let(:valid_attributes) { FactoryGirl.attributes_for(:company) }

  let(:invalid_attributes) do
    {
      name: nil,
    }
  end

  let(:valid_session) { {} }

  login_user

  describe "GET #index" do
    it "assigns all companies as @companies" do
      company = FactoryGirl.create(:company, user_id: controller.current_user.id)
      get :index, {}, valid_session
      expect(assigns(:companies)).to eq([company])
    end
  end


  describe "GET #new" do
    it "assigns a new company as @company" do
      get :new, {}, valid_session
      expect(assigns(:company)).to be_a_new(Company)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Company" do
        expect {
          post :create, {:company => valid_attributes}, valid_session
        }.to change(Company, :count).by(1)
      end

      it "assigns a newly created company as @company" do
        post :create, {:company => valid_attributes}, valid_session
        expect(assigns(:company)).to be_a(Company)
        expect(assigns(:company)).to be_persisted
      end

      it "redirects to the created company" do
        post :create, {:company => valid_attributes}, valid_session
        expect(response).to redirect_to(investor_companies_path)
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved company as @company" do
        post :create, {:company => invalid_attributes}, valid_session
        expect(assigns(:company)).to be_a_new(Company)
      end

      it "re-renders the 'new' template" do
        post :create, {:company => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested company" do
      company = FactoryGirl.create(:company, user_id: controller.current_user.id)
      expect {
        delete :destroy, {:id => company.to_param}, valid_session
      }.to change(Company, :count).by(-1)
    end

    it "redirects to the companies list" do
      company = FactoryGirl.create(:company, user_id: controller.current_user.id)
      delete :destroy, {:id => company.to_param}, valid_session
      expect(response).to redirect_to(investor_companies_url)
    end
  end

end
