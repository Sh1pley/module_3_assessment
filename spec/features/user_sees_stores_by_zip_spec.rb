require 'rails_helper'

RSpec.describe "user can search stores by zipcode" do
  it 'will return results from default distance limited to 10 per page' do
    VCR.use_cassette("bestbuy") do
  # When I visit "/"
      visit "/"
  # And I fill in a search box with "80202" and click "search"
      fill_in "search", with: "80202"
      click_on "Search"
  # And I should see stores within 25 miles of 80202
  # And I should see a message that says "16 Total Stores"
      expect(page).to have_content("16 Total Stores")
  # And I should see exactly 10 results
      stores = Array.new
      stores = find('#parent ul').all('li')

      expect(stores.size).to eq(10)
  # Then my current path should be "/search" (ignoring params)
      expect(current_path).to be(search_path)
  # And I should see the long name, city, distance,
  # phone number and store type for each of the 10 results
      expect(page).to have_content("BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
      expect(page).to have_content("DENVER")
      expect(page).to have_content("3.45")
      expect(page).to have_content("303-270-9189")
      expect(page).to have_content("Big Box")
    end
  end
end