require 'rails_helper'

feature "Concert search engine" do
  
  scenario "No city included in the search" do
    visit '/'
    within("#city-form") do
      fill_in 'City', :with => ''
    end
    click_button 'Search'
    expect(page).to have_content 'You should provide a city'
  end
end