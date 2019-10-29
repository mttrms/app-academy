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
    create_goal('first goal', 'some details about goal 1')
    create_goal('other goal', 'some details')
    @user = User.find_by(email: 'capy@test.com')
  end

  scenario 'should list goals on user page' do
    visit user_path(@user)
    expect(page).to have_content 'first goal'
    expect(page).to have_content 'other goal'
  end

  scenario 'should have a page to view a specific goal' do
    visit user_path(@user)
    click_link 'first goal'
    expect(page).to have_content 'first goal'
    expect(page).to have_content 'some details about goal 1'
    expect(page).to have_content 'Ongoing'
  end
end

feature 'viewing goals of other users' do
  before(:each) do
    sign_up_as('capy@test.com')
    create_goal('first goal', 'some details about goal 1')
    create_goal('other goal', 'some details', true)
    @user = User.find_by(email: 'capy@test.com')
    logout
  end

  scenario 'when the goal is public' do
    visit user_path(@user)
    expect(page).to have_content 'first goal'
  end

  scenario 'when the goal is private' do
    visit user_path(@user)
    expect(page).not_to have_content 'other goal'
  end
end

feature 'completing a goal' do
  before(:each) do
    sign_up_as('capy@test.com')
    create_goal('first goal', 'some details about goal 1')
    create_goal('other goal', 'some details')
    @user = User.find_by(email: 'capy@test.com')
  end

  scenario 'when the goal has not been completed' do
    visit user_path(@user)
    click_link 'first goal'
    expect(page).not_to have_content('Completed')
  end

  scenario 'when the goal has been completed' do
    visit user_path(@user)
    click_link 'first goal'
    click_button 'Complete goal'
    expect(page).to have_content('Completed')
  end
end

feature 'editing goals' do
  before(:each) do
    sign_up_as('capy@test.com')
    create_goal('first goal', 'some details about goal 1')
    create_goal('other goal', 'some details')
    @user = User.find_by(email: 'capy@test.com')
  end

  scenario 'should have an edit goal page' do
    visit user_path(@user)
    click_link 'first goal'
    expect(page).to have_link('Edit goal')
    click_link 'Edit goal'
    expect(page).to have_content('Edit first goal')
  end

  scenario 'should have updated goal info after editing' do
    visit user_path(@user)
    click_link 'first goal'
    click_link 'Edit goal'
    fill_in 'Title', with: 'My New Goal'
    click_button 'Update Goal'
    expect(page).to have_content 'My New Goal'
  end
end

feature 'deleting goals' do
  scenario 'should allow deletion of a goal' do
    sign_up_as('capy@test.com')
    create_goal('soon to be deleted goal', 'some details about goal 1')
    click_link 'Delete goal'
    visit user_path(User.find_by(email: 'capy@test.com'))
    expect(page).not_to have_content 'soon to be deleted goal'
  end
end
