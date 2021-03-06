require 'rails_helper'

RSpec.feature 'adding company' do
  before(:all) do
    User.destroy_all
    Company.destroy_all
  end

  let(:investor) { FactoryGirl.create(:user, password: '11223344', password_confirmation: '11223344')}

  it 'adding new company' do
    visit(new_user_session_url)

    within("form") do
      fill_in 'user_email',    :with => investor.email
      fill_in 'user_password', :with => '11223344'
    end
    
    click_button "Login"

    click_link("Companies")
    click_link("Add new company")

    within("form") do
      fill_in "company_name", :with => "First company" 
      select I18n.t("industries.#{Company::INDUSTRIES.first}"), :from => "company_industry"
      fill_in "company_registration_number", :with => "000000000000"
      fill_in "company_location", :with => "Singapur"
      fill_in "company_contact", :with => "+79000000000"
      fill_in "company_website", :with => 'https://redcrowd.com'
      fill_in "company_description", :with => 'Some description'
    end

    click_button "Submit"

    expect(page.current_path).to eq(investor_companies_path)
    expect(page).to have_text("First company")
    expect(page).to have_text("Pending")
    expect(page).to have_text("Edit")
  end

end
