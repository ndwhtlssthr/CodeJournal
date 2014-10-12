require "rails_helper"

feature "User edits an entry" do
  scenario "successfully" do
    user = create(:user)
    entry = create(:entry, user: user)

    login_as(user)
    visit dashboard_path
    click_link "Edit"
    fill_in :body, with: "Actually, my day was awesome"
    click_button "Save changes"

    expect(page).to have_content("Actually, my day was awesome")
  end
end
