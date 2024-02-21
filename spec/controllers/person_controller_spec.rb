require 'rails_helper'
require 'spec_helper'

RSpec.describe PersonsController, type: :controller do
  render_views
 
   before do
    @person = FactoryBot.create(:person) 
   end

  describe 'GET #index' do
    it 'returns a success response' do
      # request.headers[:token] = @token
      # allow(controller).to receive(:authorize_request) # Stubbing authorize_request
      get :index, params: {id: @person.id}
      expect(response).to be_successful
    end
  end

  describe 'GET #create' do
    it 'Creating a person' do
      post :create, params: {person: {email: "test@gmail.com", name: "test"}}
      expect(response).to redirect_to(persons_path)

    end
  end

  describe 'GET #update' do
    it 'Updating a person' do
      put :update, params: {id: @person.id,person: { email: "test@gmail.com", name: "test"}}
      expect(response.status).to eq 200
    end
    it 'updates the person and returns success response' do
            new_attributes = { attribute1: 'new value', attribute2: 'new value' }

            put :update, params: { id: @person.id, person: new_attributes }
            expect(response).to have_http_status(:ok)
          end
  end

  describe 'GET #delete' do
    it 'destroy a specfic person' do
      delete :destroy, params: {id: @person.id }
      # expect(response.status).to eq 200
      expect(response).to redirect_to(persons_path)

    end
  end
end