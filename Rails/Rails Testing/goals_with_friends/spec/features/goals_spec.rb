require 'spec_helper'
require 'rails_helper'

feature 'creating goals' do
  scenario 'should have a goal creation page' do
    visit new_goal_path
    expect(page).to have_content 'New Goal'
    expect(page).to have_button 'Add Goal'
    expect(page).to have_field 'goal_details'
    expect(page).to have_field 'goal_private'
  end
  
  scenario 'should redirect to goal after it has been created' do
    sign_up_as('capy@test.com')
    visit new_goal_path
    fill_in 'Title', with: 'My Goal'
    fill_in 'Details', with: 'Details about my goal'
    click_button 'Add Goal'
    expect(page).to have_content 'My Goal'
  end

  scenario 'should start uncompleted' do
    sign_up_as('capy@test.com')
    visit new_goal_path
    fill_in 'Title', with: 'My Goal'
    fill_in 'Details', with: 'Details about my goal'
    click_button 'Add Goal'
    expect(page).to have_content 'Ongoing'
  end
end

feature 'viewing your own goals' do
  before(:each) do
    sign_up_as('capy@test.com')
    create_goal('first goal', 'some details')
    create_goal('other goal', 'some details')
    @user = User.find_by(email: 'capy@test.com')
  end

  scenario 'should list goals on user page' do
    visit user_path(@user)
    expect(page).to have_content 'first goal'
    expect(page).to have_content 'other goal'
  end

  scenario 'should have a page to view a specific goal'
end

feature 'viewing goals of other users' do
  scenario 'when the goal is public'
  scenario 'when the goal is private'
end

feature 'completing a goal' do
  scenario 'when the goal has not been completed'
  scenario 'when the goal has been completed'
end

feature 'editing goals' do
  scenario 'should have an edit goal page'
  scenario 'should have updated goal info after editing'
end

feature 'deleting goals' do
  scenario 'should allow deletion of a goal'
end
