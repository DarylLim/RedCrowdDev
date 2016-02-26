require 'rails_helper'

RSpec.feature 'moderating company' do
  before(:all) do
    User.destroy_all
    Company.destroy_all
  end

  let(:admin) { FactoryGirl.create(:admin, password: '11223344', password_confirmation: '11223344')}
  let(:company) { FactoryGirl.create(:company) }

  it 'moderates pending company' do
    company #create company
    visit(new_user_session_url)

    within("form") do
      fill_in 'user_email',    :with => admin.email
      fill_in 'user_password', :with => '11223344'
    end
    
    click_button "Login"

    click_link("Pending companies")
    expect(page).to have_text(company.name)
    click_link("Moderate")

    within("form") do
      fill_in "company_rejection_reason", :with => "Invalid name" 
    end

    click_button "Submit"

    expect(page.current_path).to eq(pending_admin_companies_path)
    expect(page).to_not have_text(company.name)
  end

end
