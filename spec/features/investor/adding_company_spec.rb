require 'rails_helper'

RSpec.feature 'adding company' do
  before(:all) do
    User.destroy_all
  end

  let(:investor) { FactoryGirl.create(:user, password: '11223344', password_confirmation: '11223344')}

  it 'adding new company' do
    visit(new_user_session_url)

    within("form") do
      fill_in 'user_email',    :with => investor.email
      fill_in 'user_password', :with => '11223344'
    end
    
    click_button "Login"

    click_link("Copmanies")
  end

end
