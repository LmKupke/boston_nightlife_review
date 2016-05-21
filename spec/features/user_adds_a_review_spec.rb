require 'rails_helper'


feature 'user creates a new review on a venue', %Q(
  As an authenticated user
  I want to create a new review
  So that it can be work
) do

  # Acceptance Criteria:
  # * Authenticated user is able to see a review format

  # * Authenticated user adds a review to an existing bar
  #  It shows the venue page and the recent review below

  # * I attempt to add an invalid review
  #  I am shown the bar page with no new review

  # * I attempt to add too few characters to the review box
  # I am shown the bar page with no new review

  scenario "an authenticated user sees a form to leave a new review" do
    venue = create(:venue)
    user = create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link "Sign In"
    click_link "#{venue.vname}"

    expect(page).to have_css("form")
  end

  scenario "an authenticated user adds new valid review" do
    ActionMailer::Base.deliveries.clear
    venue = create(:venue)
    user = create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link "Sign In"
    click_link "#{venue.vname}"
    choose ('***')
    fill_in "Description", with: "#{'a' * 70}"
    click_button 'Add a Review'


    expect(page).to have_content(venue.vname)
    expect(page).to have_content(user.username)
    expect(page).to have_content('***')
    expect(page).to have_content("#{'a' * 70}")
    expect(ActionMailer::Base.deliveries.count).to eq(1)

  end
  scenario "an UN-authenticated user attempts review" do
    venue = create(:venue)
    visit root_path
    click_link "#{venue.vname}"
    choose ('***')
    fill_in "Description", with: "#{'a' * 70}"
    click_button 'Add a Review'

    expect(page).to have_content("Log in")
  end

  scenario "an authenticated user attempts to add an invalid review" do
    venue = create(:venue)
    user = create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link "Sign In"
    click_link "#{venue.vname}"
    choose ('***')
    fill_in "Description", with: "#{'a' * 10}"
    click_button 'Add a Review'

    expect(page).to_not have_content("#{'a' * 10}")
  end
end
