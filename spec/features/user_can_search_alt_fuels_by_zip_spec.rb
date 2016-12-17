require 'rails_helper'

describe "User Can Search Fuel Stations" do
  it "by valid zip" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I fill in the search form with 80203
    fill_in :q, with: '80203'
    # And I click "Locate"
    click_on 'Locate'
    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq('/search')
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_selector('.station', count: 10)
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within('.station:first') do
      expect(page).to have_content('ELEC')
      expect(page).to have_content('UDR')
      expect(page).to have_content('800 Acoma St, Denver, CO')
      expect(page).to have_content('0.3117')
      expect(page).to have_content('24 hours daily')
    end
  end
end
