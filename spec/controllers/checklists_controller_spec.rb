require 'rails_helper'

RSpec.describe ChecklistsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }

  describe 'GET index' do
    it "redirects to new checklist if current user doesn't have checklist yet" do
      sign_in FactoryGirl.create(:user)

      get :index

      expect(response).to redirect_to(new_checklist_path)
    end

    it "redirects to edit checklist if current user has checklist" do
      user = FactoryGirl.create(:user_with_checklist)

      sign_in user

      get :index

      expect(response).to redirect_to(edit_checklist_path(user.checklist))
    end
  end

  describe 'GET new checklist' do
    before do
      sign_in user
    end

    it 'assigns @checklist' do
      get :new

      expect(assigns(:checklist)).to be_a_new(Checklist)
    end

    it 'renders new checklist template' do
      get :new

      expect(response).to render_template(:new)
    end

    it 'redirects to edit page if user has already created a checklist' do
      checklist = FactoryGirl.create(:checklist, user: user)

      get :new

      expect(response).to redirect_to(edit_checklist_path(checklist))
    end
  end

  describe 'POST checklist' do
    before do
      sign_in user
    end

    let!(:president) { FactoryGirl.create(:president) }
    let!(:vice_president) { FactoryGirl.create(:vice_president) }
    let!(:senators) { FactoryGirl.create_list(:senator, 12) }
    let!(:party_list) { FactoryGirl.create(:party_list) }

    it 'creates checklist' do
      post :create, checklist: { president_id: president.id, vice_president: vice_president.id,
                                 senators: senators.map(&:id), party_list_id: party_list.id }

      expect(user.checklist).to be_present
    end

    it 'redirects to checklist show page' do
      post :create, checklist: { president_id: president.id, vice_president: vice_president.id,
                                 senators: senators.map(&:id), party_list_id: party_list.id }

      expect(response).to redirect_to(user.checklist)
    end
  end

  describe 'GET edit checklist' do
    before do
      sign_in user
    end

    let!(:checklist) { FactoryGirl.create(:checklist, user: user) }

    it 'assigns @checklist' do
      get :edit, id: checklist.id

      expect(assigns(:checklist)).to eq checklist
    end

    it 'renders edit template' do
      get :edit, id: checklist.id

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT checklist' do
    before do
      sign_in user
    end

    let!(:checklist) { FactoryGirl.create(:checklist, user: user) }

    it 'updates checklist' do
      new_president = FactoryGirl.create(:president)

      put :update, id: checklist.id, checklist: { president_id: new_president.id }

      expect(assigns(:checklist).president).to eq new_president
    end

    it 'redirects to show page after successful update' do
      put :update, id: checklist.id, checklist: { president_id: FactoryGirl.create(:president) }

      expect(response).to redirect_to(checklist_path(checklist))
    end
  end
end
