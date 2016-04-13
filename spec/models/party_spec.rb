require 'rails_helper'

RSpec.describe Party, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :acronym }
  end
end
