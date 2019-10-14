require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', with: 'capybara@aol.com'
      fill_in 'Password', with: 'Hunter12'
      click_button "Sign up"
    end

    scenario "redirects to bands index page after signup" do
      expect(page).to have_content "View all bands"
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', with: 'capy@bara.com'
      click_button "Sign up"
    end

    scenario "re-renders the signup page after failed signup" do
      expect(page).to have_content "Password is too short"
    end
  end
end
