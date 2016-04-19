require 'rails_helper'

RSpec.describe Admin::PartiesController, type: :controller do
  let!(:party) { FactoryGirl.create(:party) }

  describe 'GET parties' do
    it 'assigns @parties' do
      get :index
      expect(assigns(:parties)).to eq([party])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET party' do
    it 'assigns @party' do
      get :show, id: party.id
      expect(assigns(:party)).to eq party
    end

    it 'renders show template' do
      get :show, id: party.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new party' do
    it 'assigns @party' do
      get :new
      expect(assigns(:party)).to be_a_new(Party)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST party' do
    it 'creates @party' do
      name = FFaker::Lorem.word
      acronym = FFaker::Lorem.word

      post :create, { party: {name: name, acronym: acronym} }

      expect(response).to redirect_to([:admin, assigns(:party)])
      expect(Party.where(name: name, acronym: acronym)).to exist
    end

    it 'renders new template if party creation failed' do
      post :create, { party: {name: FFaker::Lorem.word} }

      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit party' do
    it 'assigns @party' do
      get :edit, id: party.id

      expect(assigns(:party)).to eq party
    end

    it 'renders edit template' do
      get :edit, id: party.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT party' do
    it 'updates party' do
      new_name = FFaker::Lorem.word

      put :update, id: party.id, party: { name: new_name }

      expect(assigns(:party).name).to eq new_name
    end

    it 'redirects to show page after succesful update' do
      put :update, id: party.id, party: { name: 'new name' }

      expect(response).to redirect_to([:admin, party])
    end
  end

  describe 'DELETE party' do
    it 'deletes party' do
      expect {delete :destroy, id: party.id}.to change{Party.count}.by(-1)

      expect(Party.where(id: party.id)).to_not exist
    end

    it 'redirects to index page after successful deletion' do
      delete :destroy, id: party.id

      expect(response).to redirect_to(admin_parties_path)
    end

    it 'redirects to show page if party deletion failed' do
      allow(party).to receive(:destroy) { false }

      delete :destroy, id: party.id

      expect(response).to redirect_to([:admin, assigns(:party)])
    end
  end
end
