require 'rails_helper'
require 'spec_helper'

RSpec.describe DetailsController, type: :controller do
  render_views
 
   before do
    @person = FactoryBot.create(:person)
    @person_detail = Detail.create(person_id: @person.id, title: "test", phone: "78785575577",  age: "45") 
   end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {person_id: @person.id}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
  it 'returns a success response' do
    get :show, params: {person_id: @person.id, id: @person_detail}
    expect(response).to be_successful
  end
end

describe 'POST #create' do
  let(:person) { FactoryBot.create(:person) } # Assuming you're using FactoryBot for creating test data

  context 'with valid parameters' do
    it 'creates a person_detail and redirects to persons_path' do
      post :create, params: { person_id: person.id, detail: { title: "test", phone: "78785575577", age: "45" } }
      expect(response).to redirect_to(persons_path)
    end

    it 'creates a person_detail and redirects to persons_path' do
        @person1 = FactoryBot.create(:person)
        post :create, params: { person_id: @person1.id, detail: { title: "test", phone: "78785575577", age: "45" } }
        expect(response).to redirect_to(persons_path)
      end
  end
end

  describe 'GET #update' do
    it 'Updating a person_detail' do
      put :update, params: {person_id: @person.id,id: @person_detail,detail: {title: "test", phone: "78785575577",  age: "45"}}
    expect(response).to redirect_to(person_detail_path(@person, @person_detail))
    end
  end

  describe 'GET #delete' do
    it 'destroy a specfic person_detail' do
      delete :destroy, params: {person_id: @person.id, id: @person_detail}
    #   expect(response.status).to eq 200
    expect(response).to redirect_to(persons_path)
    
    end
  end
end