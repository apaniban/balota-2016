require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relationships' do
    it { should have_one :checklist }
  end
end
