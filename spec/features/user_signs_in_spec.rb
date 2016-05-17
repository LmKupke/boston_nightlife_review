require 'rails_helper'


feature 'user signs in', %Q{
  As a users I want to sign in
  So that I can have access to writing reviews and adding bars/clubs
} do

  # Acceptance Criteria:
  # * If I specify a valid, previously registerd email and password,
  # I am authenticated an I gain access to the system
  # * If I specify an invalid email and password, I remain unathenticated
  # * If I am already signed in, I can't sign in again

  scenario 'an existing user specifies a valid email and password' do
    user = create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content("Sign Out")
  end
  scenario 'a nonexistant email and password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'whitewalker@northwall.com'
    fill_in 'Password', with: 'thedeadwillrule'
    click_button 'Log In'
    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Welcome Back!")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'an existing email with the wrong password is denied access ' do
    user = create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrongpassword'
    click_button 'Log In'

    expect(page).to have_content("Invalid Email or password")
    expect(page).to_not have_content("Welcome Back!")
    expect(page).to_not have_content("Sign Out")
  end
  scenario 'a already authenticated user cannot re-sign in' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'

    expect(page).to have_content("Welcome Back!")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    expect(page).to have_content("You are already signed in.")
  end
end
