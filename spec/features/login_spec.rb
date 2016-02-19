require 'rails_helper'

RSpec.feature 'sign in' do
  let(:user) { FactoryGirl.create(:user, password: '11223344', password_confirmation: '11223344')}

  scenario 'user get correct email and password' do
    visit(root_url)
    click_link("Login")
    expect(page).to have_text("Email")
    expect(page).to have_text("Password")

    within("form") do
      fill_in 'user_email',    :with => user.email
      fill_in 'user_password', :with => '11223344'
    end
    click_button "Login"

    expect(page).to have_text(user.email)
  end

  scenario 'user get incorrect email and password' do
    visit(root_url)
    click_link("Login")
    expect(page).to have_text("Email")
    expect(page).to have_text("Password")

    within("form") do
      fill_in 'user_email',    :with => user.email
      fill_in 'user_password', :with => 'incorrect'
    end
    click_button "Login"

    expect(page).to have_text("Invalid email or password.")
  end
end
