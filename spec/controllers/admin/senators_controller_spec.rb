require 'rails_helper'

RSpec.describe Admin::SenatorsController, type: :controller do
  let!(:party) { FactoryGirl.create(:party) }
  let!(:senator) { FactoryGirl.create(:senator, party: party) }

  describe 'GET senators' do
    it 'assigns @senators' do
      get :index
      expect(assigns(:senators)).to eq([senator])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET senator' do
    it 'assigns @senator' do
      get :show, id: senator.id
      expect(assigns(:senator)).to eq senator
    end

    it 'renders show template' do
      get :show, id: senator.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new senator' do
    it 'assigns @senator' do
      get :new
      expect(assigns(:senator)).to be_a_new(Senator)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST senator' do
    it 'creates @party' do
      name = FFaker::Name.name
      ballot_name = FFaker::Name.name
      ballot_number = Random.rand(1..100)
      party_id = party.id

      post :create, { senator: {name: name, ballot_name: ballot_name, ballot_number: ballot_number,
                                party_id: party_id} }

      expect(response).to redirect_to([:admin, assigns(:senator)])
      expect(Senator.where(name: name, ballot_name: ballot_name, ballot_number: ballot_number,
                         party_id: party_id)).to exist
    end

    it 'renders new template if party creation failed' do
      post :create, { senator: {name: FFaker::Name.name} }

      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit senator' do
    it 'assigns @senator' do
      get :edit, id: senator.id

      expect(assigns(:senator)).to eq senator
    end

    it 'renders edit template' do
      get :edit, id: senator.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT senator' do
    it 'updates senator' do
      new_name = FFaker::Name.name

      put :update, id: senator.id, senator: { name: new_name }

      expect(assigns(:senator).name).to eq new_name
    end

    it 'redirects to show page after succesful update' do
      put :update, id: senator.id, senator: { name: 'new name' }

      expect(response).to redirect_to([:admin, senator])
    end
  end

  describe 'DELETE senator' do
    it 'deletes senator' do
      expect {delete :destroy, id: senator.id}.to change{Senator.count}.by(-1)

      expect(Senator.where(id: party.id)).to_not exist
    end

    it 'redirects to index page after successful deletion' do
      delete :destroy, id: senator.id

      expect(response).to redirect_to(admin_senators_path)
    end

    it 'redirects to show page if senator deletion failed' do
      allow(senator).to receive(:destroy) { false }

      delete :destroy, id: senator.id

      expect(response).to redirect_to([:admin, assigns(:senator)])
    end
  end
end
