# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do

  background :each do
    visit new_user_url
  end

  scenario 'has a new user page' do
    save_and_open_page
    expect(page).to have_content("New User")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
      fill_in "Username", with: "dobby"
      fill_in "Password", with: "password"

      click_button "Sign Up"

      expect(page).to have_content("dobby")
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    visit new_session_url
    fill_in "Username", with: "dobby"
    fill_in "Password", with: "password"

    click_button "Sign In"

    expect(page).to have_content("dobby")
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit new_session_url
    expect(page).to have_content("Sign In")
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    fill_in "Username", with: "dobby"
    fill_in "Password", with: "password"
    click_button "Sign In"
    expect(page).to have_content("dobby")
    click_button "Sign Out"
    expect(page).not_to have_content("dobby")
  end 

end
