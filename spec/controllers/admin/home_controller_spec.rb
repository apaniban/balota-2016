require 'rails_helper'

RSpec.describe Admin::HomeController, type: :controller do
  login_admin

  context 'GET /admin' do
    it 'assigns @user_count' do
      user_count = 10
      FactoryGirl.create_list(:user, user_count)

      get :index

      expect(assigns(:user_count)).to eq user_count
    end

    it 'renders home template' do
      get :index

      expect(response).to render_template(:index)
    end
  end
end
