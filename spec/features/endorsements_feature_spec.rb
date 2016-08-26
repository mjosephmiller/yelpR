require 'rails_helper'

feature 'endorsing reviews' do
  before do
    sign_up
    create_restaurant
    click_link 'Sign out'
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
   sign_up
   visit '/restaurants'
   click_link 'Endorse'
   expect(page).to have_content('1 endorsement')
  end

end
