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
end
