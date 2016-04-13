require 'rails_helper'

RSpec.describe Party, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :acronym }
  end

  context 'relationships' do
    it { should have_many :presidents }
    it { should have_many :vice_presidents }
    it { should have_many :senators }
  end
end
