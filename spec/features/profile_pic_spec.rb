require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in "First Name", with: "Ash"
    fill_in "Last Name", with: "Catchem"
    fill_in "Username", with: "gottacatchemall"
    fill_in "Email", with: "ash@s-mart.com"
    fill_in "user_password", with: "boomstick!3vilisd3ad"
    fill_in "Password Confirmation", with: "boomstick!3vilisd3ad"
    attach_file "Profile photo", "#{Rails.root}/spec/support/images/profile.png"
    click_button "Sign Up"

    expect(page).to have_content("Congrats! Write a review or submit a new bar/pub!")
    expect(page).to have_css("img[src*='profile.png']")
  end
end
