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

  scenario 'a user can endorse a review, which updates the review endorsement count' do
   sign_up
   visit '/restaurants'
   click_link 'KFC'
   click_link 'Endorse'
   click_link 'KFC'
   expect(page).to have_content('1 endorsement')
  end

end
