require "rails_helper"

RSpec.feature "User edits his trip" do
  scenario "and add a description" do
    trip_city = Trip.create(city: "Krakow").city
    trip_description = "My latest trip to Krakow was fun!"

    visit root_path
    click_on trip_city
    fill_in "trip_description", with: trip_description
    click_on "Update"

    expect(page).to have_text trip_description
  end
end
