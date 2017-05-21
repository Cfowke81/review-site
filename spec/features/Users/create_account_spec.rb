require 'rails_helper'

feature 'user creates new account' do

  let!(:new_user) {
    User.new(
      username: "Ceeplusplus",
      email: "javaismycopilot@gmail.com",
      password: "Changeme"
    )
  }

    scenario 'user visits homepage' do
      visit '/'

      click_button 'Create Account'

      expect(page).to have_content('Sign up')
    end

    scenario 'user successfully creates account' do
      visit '/'

      click_button 'Create Account'

      fill_in 'Username', with: new_user.username
      fill_in 'Email', with: new_user.email
      fill_in 'Password', with: new_user.password
      fill_in 'Password confirmation', with: new_user.password

      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'user unsuccessfully creates account' do
      visit '/'

      click_button 'Create Account'

      fill_in 'Username', with: new_user.username
      fill_in 'Email', with: new_user.email

      click_button 'Sign up'

      expect(page).to have_content("Password can't be blank")
    end
end