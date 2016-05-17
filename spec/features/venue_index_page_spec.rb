require 'rails_helper'

feature 'vistor goes to homepage', %Q{
  As a visitor
  I want to see all bars/clubs
  So that I can see what has been reviewed
} do

  scenario 'goes to root path' do
    bar = create(:venue)
    club = create(:venue, vname: "Whisky Saigon", price: 3, cover: true, streetnumber: 166 , streetname: "Boylston Street", vtype: "Club", neighborhood: "Back Bay" )
    visit root_path

    expect(page).to have_link(bar.vname)
    expect(page).to have_link(club.vname)
  end
end
