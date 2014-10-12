require "rails_helper"

feature "User edits an entry" do
  scenario "successfully" do
    user = create(:user)
    entry = create(:entry, user: user)

    login_as(user)
    visit dashboard_path
    puts page.body
    update_entry_body("Actually, my day was awesome")

    expect(page).to have_content("Actually, my day was awesome")
  end

  def update_entry_body(new_contents)
    click_link "Edit"
    fill_in :body, with: ""
    click_button "Save changes"
  end
end
