require 'rails_helper'

feature 'endorsing reviews' do
  before do
    sign_up
    create_restaurant
    click_link 'Review KFC'
    fill_in 'Thoughtsandfeelings', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    click_link 'Sign out'
  end

  it 'a user can endorse a review, which increments the endorsement count', js: true do
    visit '/restaurants'
    click_link 'KFC'
    click_link 'Endorse'
    expect(page).to have_content("1 endorsement")
  end

end
