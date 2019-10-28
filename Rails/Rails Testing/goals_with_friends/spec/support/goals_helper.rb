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
  def logout
    click_link 'Sign out'
  end
  def create_goal(title, details, private = false)
    visit new_goal_path
    fill_in 'Title', with: title
    fill_in 'Details', with: details
    check 'goal_private' if private
    click_button 'Add Goal'
  end
end
