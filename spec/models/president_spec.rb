require 'rails_helper'

RSpec.describe President, type: :model do
  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :ballot_name }

    it { should validate_presence_of :ballot_number }
    it { should validate_uniqueness_of :ballot_number }
    it { should validate_numericality_of :ballot_number }
    it { should_not allow_value(0).for :ballot_number }
    it { should allow_value(1).for :ballot_number }
  end

  context 'relationships' do
    it { should belong_to :party }
    it { should have_many :checklists }
  end

  describe '#name_with_ballot_number' do
    let!(:president) { FactoryGirl.create(:president) }

    it { expect(president.name_with_ballot_number).to eq "#{president.ballot_number}. #{president.ballot_name}" }
  end
end
