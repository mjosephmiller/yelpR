def sign_up
  visit '/users/sign_up'
  fill_in('Email', with: 'user@user.com')
  fill_in('Password', with: 'password')
  fill_in('Password confirmation', with: 'password')
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/users/sign_in'
  fill_in('Email', with: 'user@user.com')
  fill_in('Password', with: 'password')
  click_button 'Log in'
end

def create_restaurant
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: "KFC"
  fill_in 'Description', with: 'Deep fried goodness'
  click_button 'Create Restaurant'
end
