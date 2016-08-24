require 'rails_helper'

feature 'restaruants' do
  let!(:user) do
      User.create(email: 'user@user.com', password: 'password', password_confirmation: 'password')
    end

  context 'no restaurants should have been added'do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do

    before do
      Restaurant.create(name: 'KFC')
    end

    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants have')
    end
  end

  context 'creating restaurants' do

    scenario "prompts user to sign in if they haven't already" do
      visit '/restaurants'
      click_link "Add a restaurant"
      expect(page).to have_content 'Log in'
    end

    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      sign_in(email: 'user@user.com', password: 'password')
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: "Gorgeous Georgia's Georgian Grub"
      click_button 'Create Restaurant'
      expect(page).to have_content "Gorgeous Georgia's Georgian Grub"
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'viewing restaurants' do

    let!(:gggg){ Restaurant.create(name: "Georgious Georgia's Georgian Grub") }

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link "Georgious Georgia's Georgian Grub"
      expect(page).to have_content "Georgious Georgia's Georgian Grub"
      expect(current_path).to eq "/restaurants/#{gggg.id}"
    end
  end

  context 'editing restaurants' do

    before { sign_in(email: 'user@user.com', password: 'password') }

    scenario 'let a user edit a restaurant' do
     Restaurant.create name: 'KFC', description: 'Deep fried goodness'
     visit '/restaurants'
     click_link 'Edit KFC'
     fill_in 'Name', with: 'Kentucky Fried Chicken'
     fill_in 'Description', with: 'Deep fried goodness'
     click_button 'Update Restaurant'
     expect(page).to have_content 'Kentucky Fried Chicken'
     expect(page).to have_content 'Deep fried goodness'
     expect(current_path).to eq '/restaurants'
    end
  end

  context 'deleting restaurants' do

  before {  sign_in(email: 'user@user.com', password: 'password') }

    scenario 'removes a restaurant when a user clicks a delete link' do
      Restaurant.create name: 'KFC', description: 'Deep fried goodness'
      visit '/restaurants'
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end

  end

    context 'an invalid restaurant' do
    it 'does not let you submit a name that is too short' do
      sign_in(email: 'user@user.com', password: 'password')
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'kf'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'kf'
      expect(page).to have_content 'error'
    end
  end

end
