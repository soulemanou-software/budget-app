require 'rails_helper'

RSpec.describe 'splash_screen#index', type: :feature do
  it 'displays app name' do
    visit root_path
    expect(page).to have_content('CashVerse')
  end

  it 'Redirects to sign_in page' do
    visit root_path
    click_link 'Log in'
    expect(current_path).to match new_user_session_path
  end

  it 'Redirects to sign_up page' do
    visit root_path
    click_link 'Sign Up'
    expect(current_path).to match new_user_registration_path
  end
end
