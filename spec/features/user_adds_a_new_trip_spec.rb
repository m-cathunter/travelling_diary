require "rails_helper"

RSpec.feature "User adds a new post" do
  scenario "and see the page with submitted city" do
    trip_city = "My new work"

    visit root_path
    click_on "Add new trip"
    fill_in "trip_city", with: trip_city
    click_on "Submit"

    expect(page).to have_link trip_city
  end
end
