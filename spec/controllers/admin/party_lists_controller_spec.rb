require 'rails_helper'

RSpec.describe Admin::PartyListsController, type: :controller do
  let!(:party_list) { FactoryGirl.create(:party_list) }

  describe 'GET party lists' do
    it 'assigns @party_lists' do
      get :index
      expect(assigns(:party_lists)).to eq([party_list])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET party_list' do
    it 'assigns @party_list' do
      get :show, id: party_list.id
      expect(assigns(:party_list)).to eq party_list
    end

    it 'renders show template' do
      get :show, id: party_list.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new party_list' do
    it 'assigns @party_list' do
      get :new
      expect(assigns(:party_list)).to be_a_new(PartyList)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST party_list' do
    it 'creates @party_list' do
      name = FFaker::Lorem.word
      acronym = FFaker::Lorem.word
      ballot_number = Random.rand(1..100)

      post :create, { party_list: {name: name, acronym: acronym, ballot_number: ballot_number} }

      expect(response).to redirect_to([:admin, assigns(:party_list)])
      expect(PartyList.where(name: name, acronym: acronym, ballot_number: ballot_number)).to exist
    end

    it 'renders new template if party_list creation failed' do
      post :create, { party_list: {name: FFaker::Lorem.word} }

      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit party_list' do
    it 'assigns @party_list' do
      get :edit, id: party_list.id, party_list: { name: 'new name' }

      expect(assigns(:party_list)).to eq party_list
    end

    it 'renders edit template' do
      get :edit, id: party_list.id, party_list: { name: 'new name' }

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT party_list' do
    it 'updates party_list' do
      new_name = FFaker::Lorem.word

      put :update, id: party_list.id, party_list: { name: new_name }

      expect(assigns(:party_list).name).to eq new_name
    end

    it 'redirects to show page after succesful update' do
      put :update, id: party_list.id, party_list: { name: 'new name' }

      expect(response).to redirect_to([:admin, party_list])
    end
  end

  describe 'DELETE party_list' do
    it 'deletes party_list' do
      expect {delete :destroy, id: party_list.id}.to change{PartyList.count}.by(-1)

      expect(PartyList.where(id: party_list.id)).to_not exist
    end

    it 'redirects to index page after successful deletion' do
      delete :destroy, id: party_list.id

      expect(response).to redirect_to(admin_party_lists_path)
    end

    it 'redirects to show page if party_list deletion failed' do
      allow(party_list).to receive(:destroy) { false }

      delete :destroy, id: party_list.id

      expect(response).to redirect_to([:admin, assigns(:party_list)])
    end
  end
end
