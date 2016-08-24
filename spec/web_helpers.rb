def sign_up(email: 'test@mail.com',
            password: 'password',
            password_confirmation:'password')

  visit '/users/sign_up'
  fill_in('Email', with: :email)
  fill_in('Password', with: :password)
  fill_in('Password confirmation', with: :password)
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit 'users/sign_in'
  fill_in('Email', with: 'user@user.com')
  fill_in('Password', with: 'password')
  click_button 'Log in'
end
