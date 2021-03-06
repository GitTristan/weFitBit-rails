require 'rails_helper'

feature 'User signup flow' do

  scenario 'allows a user to sign up' do
    visit root_path
    expect(page).to have_content 'weFitBit'

    click_link 'Sign Up'
    expect(current_path).to eq sign_up_path
    expect(page).to have_content 'Are you ready?'

    fill_in :user_user_name, with: 'Testy'
    fill_in :user_email, with: 'testyMcTesterson@example.com'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'
    click_button "Let's do this"

    expect(current_path).to eq new_challenge_path
    expect(page).to have_content "Let's create a challenge"

    expect(page).to have_content 'Thanks for signing up!'
  end
end
