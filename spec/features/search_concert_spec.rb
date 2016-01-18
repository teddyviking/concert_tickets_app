require 'rails_helper'

feature "Concert search engine" do
  background do
    visit '/'
  end
  
  scenario "No city included in the search" do
    within("#city-form") do
      fill_in 'city', :with => ''
    end
    click_button 'Search'
    expect(page).to have_content 'You should provide a city'
  end

  scenario "A city with no concerts is included in the search" do
    within("#city-form") do
      fill_in 'city', :with => 'Dos Hermanas'
    end
    click_button 'Search'
    expect(page).to have_content 'There is no concerts in Dos Hermanas'
  end

  scenario "A city with a concert is included in the search" do
    concert = create(:concert, city: 'Sevilla')
    within("#city-form") do
      fill_in 'city', :with => 'Sevilla'
    end
    click_button 'Search'
    expect(page).to have_link concert_path(concert)
  end
end