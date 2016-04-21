require 'rails_helper'

RSpec.describe ChecklistsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }

  describe 'GET checklist' do
    before do
      sign_in user
    end

    it 'assigns @checklist' do
      get :show

      expect(assigns(:checklist)).to eq user.checklist
    end
  end

  describe 'GET edit checklist' do
    before do
      sign_in user
    end

    it 'assigns @checklist' do
      get :edit

      expect(assigns(:checklist)).to eq user.checklist
    end

    it 'renders edit template' do
      get :edit

      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT checklist' do
    before do
      sign_in user
    end

    it 'updates checklist' do
      new_president = FactoryGirl.create(:president)

      put :update, checklist: { president_id: new_president.id }

      expect(assigns(:checklist).president).to eq new_president
    end

    it 'redirects to show page after successful update' do
      put :update, checklist: { president_id: FactoryGirl.create(:president) }

      expect(response).to redirect_to(checklist_path)
    end
  end
end
