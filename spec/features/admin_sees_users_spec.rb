require "rails_helper"

feature "admin access" do
  scenario "admin goes to admin page" do
    user = create(:user)
    user2 = create(:user)
    admin = create(:user, role: "admin")
    visit root_path
    login_as(admin, scope: :user)
    click_link "Sign In"
    click_link "Admin Access"

    expect(page).to have_content("Admin Access")
    expect(page).to have_content(user.fullname)
    expect(page).to have_content(user.role.capitalize)
    expect(page).to have_content(user.email)

    expect(page).to have_content(user2.fullname)
    expect(page).to have_content(user.role.capitalize)
    expect(page).to have_content(user2.email)
  end

  scenario "admin goes to admin page and deletes user" do
    user = create(:user)
    user2 = create(:user)
    admin = create(:user, role: "admin")
    visit root_path
    login_as(admin, scope: :user)
    click_link "Sign In"
    click_link "Admin Access"
    click_button "delete-#{user.username}"

    # save_and_open_page
    expect(page).to have_content(user2.username)
    expect(page).to_not have_content(user.username)
    expect(page).to have_content("You have successfully deleted a user and their reviews")
  end

  scenario "admin goes to admin page and see individual users data and actions" do
    user1 = create(:user)
    venue = create(:venue)
    user1review = create(:review, user: user1, venue: venue)
    admin = create(:user, role: "admin")
    visit root_path
    login_as(admin, scope: :user)
    click_link "Sign In"
    click_link "Admin Access"
    click_link user1.username


    expect(page).to have_content(user1.fullname)
    expect(page).to have_content(user1.username)
    expect(page).to have_content(user1.email)
    expect(page).to have_content(user1review.description)
  end

end
