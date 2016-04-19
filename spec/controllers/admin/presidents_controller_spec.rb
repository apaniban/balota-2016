require 'rails_helper'

RSpec.describe Admin::PresidentsController, type: :controller do
  let!(:party) { FactoryGirl.create(:party) }
  let!(:president) { FactoryGirl.create(:president, party: party) }

  describe 'GET presidents' do
    it 'assigns @presidents' do
      get :index
      expect(assigns(:presidents)).to eq([president])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET president' do
    it 'assigns @president' do
      get :show, id: president.id
      expect(assigns(:president)).to eq president
    end

    it 'renders show template' do
      get :show, id: president.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new president' do
    it 'assigns @president' do
      get :new
      expect(assigns(:president)).to be_a_new(President)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST president' do
    it 'creates @party' do
      name = FFaker::Name.name
      ballot_name = FFaker::Name.name
      ballot_number = Random.rand(1..100)
      party_id = party.id

      post :create, { president: {name: name, ballot_name: ballot_name, ballot_number: ballot_number,
                                party_id: party_id} }

      expect(response).to redirect_to([:admin, assigns(:president)])
      expect(President.where(name: name, ballot_name: ballot_name, ballot_number: ballot_number,
                         party_id: party_id)).to exist
    end

    it 'renders new template if party creation failed' do
      post :create, { president: {name: FFaker::Name.name} }

      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit president' do
    it 'assigns @president' do
      get :edit, id: president.id

      expect(assigns(:president)).to eq president
    end

    it 'renders edit template' do
      get :edit, id: president.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT president' do
    it 'updates president' do
      new_name = FFaker::Name.name

      put :update, id: president.id, president: { name: new_name }

      expect(assigns(:president).name).to eq new_name
    end

    it 'redirects to show page after succesful update' do
      put :update, id: president.id, president: { name: 'new name' }

      expect(response).to redirect_to([:admin, president])
    end
  end

  describe 'DELETE president' do
    it 'deletes president' do
      expect {delete :destroy, id: president.id}.to change{President.count}.by(-1)

      expect(President.where(id: party.id)).to_not exist
    end

    it 'redirects to index page after successful deletion' do
      delete :destroy, id: president.id

      expect(response).to redirect_to(admin_presidents_path)
    end

    it 'redirects to show page if president deletion failed' do
      allow(president).to receive(:destroy) { false }

      delete :destroy, id: president.id

      expect(response).to redirect_to([:admin, assigns(:president)])
    end
  end
end
