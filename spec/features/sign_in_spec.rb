require 'rails_helper'

feature 'sign_up', %Q{
  As an unathenticated user
  I want to sign up
  So that I can get full access to the review site
} do

  # ACCEPTANCE CRITERIA
  # * I must specify a valid email address
  # * I must specify a password, and confirm that password
  # * If I do not perform the above, I get an error message
  # * If I specify valid info, I register my account and am authenticated

  scenario 'specify valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First Name', with: 'Jon'
    fill_in 'Last Name', with: "Snow"
    fill_in 'Username', with: 'lordcommander'
    fill_in 'Email', with: 'gameofthrones@got.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Congrats! Write a review or submit a new bar/pub!")
    expect(page).to have_content("Sign Out")
  end


  scenario 'required information is not supplied'

  scenario 'password confirmation does not match confirmation'
end
