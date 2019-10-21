require 'spec_helper'
require 'rails_helper'

feature 'creating goals' do
  scenario 'should have a goal creation page'
  scenario 'should redirect to goal after it has been created'
  scenario 'should start uncompleted'
end

feature 'viewing your own goals' do
  scenario 'should list goals on user page'
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
