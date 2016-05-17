require 'rails_helper'


feature 'user creates a new item to be reviewed', %Q(
  As an authenticated user
  I want to create a new item
  So that it can be reviewed
) do

  # Acceptance Criteria:
  # * If I specify a valid, new bar/club
  # I am taken to the bar/club show page

  # * If I specify an invalid bar/club
  # I am shown the form again

  # * If I add an already existing bar/club with same name and address
  # I am shown the form page again with error of existing bar

  # * If I add a same name and a different address
  # I am shown the form page again with error of existing name

  # * If I add a different name and an existing address
  # I am shown the form page again with error of existing address

  scenario 'user adds a valid bar/club' do
    user = create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link "Sign In"
    click_button "Add Bar or Club"
    fill_in "venue_vname", with: "Sissy K's"
    fill_in 'Street Number', with: 6
    fill_in 'Street Name', with: 'Commercial Street'
    select 'Waterfront', from: 'Neighborhood'
    select 'Club', from: 'Bar or Club?'
    select '$$', from: 'Price'
    choose ('Yes')


    click_button 'Add Business'

    expect(page).to have_content("Sissy K's")
  end
  scenario 'user adds an invalid bar/club' do
    user = create(:user)
    visit root_path
    login_as(user, scope: :user)
    click_link "Sign In"
    click_button "Add Bar or Club"
    click_button 'Add Business'

    expect(page).to_not have_content("Sissy K's")
    expect(page).to have_content("Add New Business")
    expect(page).to have_css('form')

  end
  scenario 'user adds an already existing bar/club with same name and address' do
    user = create(:user)
    venue = create(:venue, user: user)
    visit root_path
    login_as(user, scope: :user)
    click_link "Sign In"
    click_button "Add Bar or Club"
    fill_in "venue_vname", with: venue.vname
    fill_in 'Street Number', with: venue.streetnumber
    fill_in 'Street Name', with: venue.streetname
    select 'Waterfront', from: 'Neighborhood'
    select 'Club', from: 'Bar or Club?'
    select '$$', from: 'Price'
    choose ('Yes')
    click_button 'Add Business'
    
    expect(page).to_not have_content(venue.vname)
    expect(page).to have_content("Add New Business")
    expect(page).to have_css('form')
  end

  scenario 'user adds an existing bar/club name and a different address'

  scenario 'user adds a different name and an existing address'
end
