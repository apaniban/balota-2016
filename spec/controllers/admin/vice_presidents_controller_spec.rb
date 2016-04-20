require 'rails_helper'

RSpec.describe Admin::VicePresidentsController, type: :controller do
  login_admin

  let!(:party) { FactoryGirl.create(:party) }
  let!(:vice_president) { FactoryGirl.create(:vice_president, party: party) }

  describe 'GET vice_presidents' do
    it 'assigns @vice_presidents' do
      get :index
      expect(assigns(:vice_presidents)).to eq([vice_president])
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET vice_president' do
    it 'assigns @vice_president' do
      get :show, id: vice_president.id
      expect(assigns(:vice_president)).to eq vice_president
    end

    it 'renders show template' do
      get :show, id: vice_president.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET new vice_president' do
    it 'assigns @vice_president' do
      get :new
      expect(assigns(:vice_president)).to be_a_new(VicePresident)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST vice_president' do
    it 'creates @party' do
      name = FFaker::Name.name
      ballot_name = FFaker::Name.name
      ballot_number = Random.rand(1..100)
      party_id = party.id

      post :create, { vice_president: {name: name, ballot_name: ballot_name, ballot_number: ballot_number,
                                party_id: party_id} }

      expect(response).to redirect_to([:admin, assigns(:vice_president)])
      expect(VicePresident.where(name: name, ballot_name: ballot_name, ballot_number: ballot_number,
                         party_id: party_id)).to exist
    end

    it 'renders new template if party creation failed' do
      post :create, { vice_president: {name: FFaker::Name.name} }

      expect(response).to render_template(:new)
    end
  end

  describe 'GET edit vice_president' do
    it 'assigns @vice_president' do
      get :edit, id: vice_president.id

      expect(assigns(:vice_president)).to eq vice_president
    end

    it 'renders edit template' do
      get :edit, id: vice_president.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT vice_president' do
    it 'updates vice_president' do
      new_name = FFaker::Name.name

      put :update, id: vice_president.id, vice_president: { name: new_name }

      expect(assigns(:vice_president).name).to eq new_name
    end

    it 'redirects to show page after succesful update' do
      put :update, id: vice_president.id, vice_president: { name: 'new name' }

      expect(response).to redirect_to([:admin, vice_president])
    end
  end

  describe 'DELETE vice_president' do
    it 'deletes vice_president' do
      expect {delete :destroy, id: vice_president.id}.to change{VicePresident.count}.by(-1)

      expect(VicePresident.where(id: party.id)).to_not exist
    end

    it 'redirects to index page after successful deletion' do
      delete :destroy, id: vice_president.id

      expect(response).to redirect_to(admin_vice_presidents_path)
    end

    it 'redirects to show page if vice_president deletion failed' do
      allow(vice_president).to receive(:destroy) { false }

      delete :destroy, id: vice_president.id

      expect(response).to redirect_to([:admin, assigns(:vice_president)])
    end
  end
end
