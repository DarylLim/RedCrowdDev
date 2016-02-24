require 'rails_helper'

RSpec.feature 'sign in' do
  before(:all) do
    User.destroy_all
  end

  let(:user) { FactoryGirl.create(:user, password: '11223344', password_confirmation: '11223344')}
  let(:admin) { FactoryGirl.create(:admin, password: '11223344', password_confirmation: '11223344')}


  scenario 'admin get correct email and password' do
    visit(root_url)
    click_link("Login")
    expect(page).to have_text("Email")
    expect(page).to have_text("Password")

    within("form") do
      fill_in 'user_email',    :with => admin.email
      fill_in 'user_password', :with => '11223344'
    end
    
    click_button "Login"

    expect(page.current_path).to eq(admin_root_path)
  end

  scenario 'admin get incorrect email and password' do
    visit(root_url)
    click_link("Login")
    expect(page).to have_text("Email")
    expect(page).to have_text("Password")

    within("form") do
      fill_in 'user_email',    :with => admin.email
      fill_in 'user_password', :with => 'incorrect'
    end
    click_button "Login"

    expect(page).to have_text("Invalid email or password.")
  end

  scenario 'investor try to move into admin area' do
    visit(new_user_session_path)

    within("form") do
      fill_in 'user_email',    :with => user.email
      fill_in 'user_password', :with => '11223344'
    end
    
    click_button "Login"

    expect(page.current_path).to eq(investor_root_path)

    visit(admin_root_path)
    expect(page.current_path).not_to eq(admin_root_path)
  end

end
