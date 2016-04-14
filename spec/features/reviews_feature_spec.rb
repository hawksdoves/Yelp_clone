require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  scenario 'allows users to leave a review using a form' do
     visit '/restaurants'
     User.create(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
     user_sign_in
     click_link 'Review KFC'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'

     expect(current_path).to eq '/restaurants'
     expect(page).to have_content('so so')
  end

  scenario 'allows users to leave only one review per restaurant' do
     visit '/restaurants'
     User.create(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
     user_sign_in
     click_link 'Review KFC'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'
     expect(page).not_to have_content('Review KFC')
  end

end