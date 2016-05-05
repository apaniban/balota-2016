require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET index' do
    it 'renders index template' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'redirects to checklist_path if user is currently signed in' do
      sign_in FactoryGirl.create(:user)

      get :index

      expect(response).to redirect_to(checklist_path)
    end
  end
end
