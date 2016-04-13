require 'rails_helper'

RSpec.describe PartyList, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :acronym }

    it { should validate_presence_of :ballot_number }
    it { should validate_uniqueness_of :ballot_number }
    it { should validate_numericality_of :ballot_number }
    it { should_not allow_value(0).for :ballot_number }
    it { should allow_value(1).for :ballot_number }
  end
end
