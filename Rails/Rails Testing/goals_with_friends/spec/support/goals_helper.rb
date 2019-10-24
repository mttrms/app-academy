module GoalsHelper
  def sign_up_as(email)
    visit new_user_path
    fill_in 'Email', with: email
    fill_in 'Password', with: 'Hunter12'
    click_button 'Sign up'
  end
  def login_as(email)
    visit new_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: 'Hunter12'
    click_button 'Sign in'
  end
end
