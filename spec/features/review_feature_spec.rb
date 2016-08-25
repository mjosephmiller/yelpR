require 'rails_helper'

feature 'reviewing' do
  scenario 'allows users to leave a review using a form'do
  sign_up
  create_restaurant
  click_link 'Review KFC'
  fill_in 'Thoughtsandfeelings', with: 'so so'
  select '3', from: 'Rating'
  click_button 'Leave Review'
  expect(current_path).to eq '/restaurants'
  click_link 'KFC'
  expect(page).to have_content('so so')
  end

  describe 'reviews' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:restaurant) { Restaurant.create name: 'Test' }
      let(:review_params) { {rating: 5, thoughtsandfeelings: 'yum'} }

      subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

      it 'builds a review' do
        expect(review).to be_a Review
      end

      it 'builds a review associated with the specified user' do
        expect(review.user).to eq user
      end
    end
  end

  scenario 'displays an average rating for all reviews' do
    sign_up
    create_restaurant
    leave_review('So so', '3')
    click_link 'Sign out'
    another_sign_up
    leave_review('Excellent', '5')
    expect(page).to have_content('Average rating: 4.0 ★★★★☆')
  end
end
