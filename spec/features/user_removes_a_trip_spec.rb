require "rails_helper"

RSpec.feature "User removes his trip" do
  scenario "and add a description" do
    trip_city = Trip.create(city: "Krakow").city

    visit root_path
    click_on trip_city
    click_on "Remove"

    expect(page).not_to have_text trip_city
  end
end
