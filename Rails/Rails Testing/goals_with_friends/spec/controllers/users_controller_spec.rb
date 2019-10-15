require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders thew new users page' do
      get :new, params: {}

      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 'renders the form with an error' do
        post :create, params: { user: { email: 'fake@email.com', password: '' }}

        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end

      it 'requires the password to be at least 6 characters' do
        post :create, params: { user: { email: 'fake@email.com', password: 'hnt12' }}

        expect(response).to render_template('new')
        expect(flash[:errors]).to be_present
      end
    end

    context 'with valid credentials' do
      it 'redirects the user' do
        post :create, params: { user: { email: 'fake@email.com', password: 'Hunter12' }}

        expect(response).to have_http_status(302)
      end
    end
  end
end
