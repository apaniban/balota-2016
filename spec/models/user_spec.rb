require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relationships' do
    it { should have_one :checklist }
  end

  context 'validations' do
    it { should validate_uniqueness_of(:username).case_insensitive }
  end

  context 'callbacks' do
    it 'creates blank checklist after user creation' do
      user = FactoryGirl.build(:user)

      expect(user).to receive(:create_checklist)

      user.save
    end
  end

  describe '.registered_using_omniauth?' do
    it 'should return true if uid and provider are present' do
      user = FactoryGirl.create(:user, uid: 123, provider: 'facebook')

      expect(user.registered_using_omniauth?).to be true
    end

    it 'should return false if username and password are present' do
      user = FactoryGirl.create(:user, username: 'testing', password: 'password')

      expect(user.registered_using_omniauth?).to be false
    end
  end
end
