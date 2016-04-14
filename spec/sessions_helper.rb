def user_sign_in(email: 'test@example.com',
                 password: 'testtest')
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end