require 'rails_helper'

RSpec.describe Checklist, type: :model do
  context 'relationships' do
    it { should belong_to :president }
    it { should belong_to :vice_president }
    it { should belong_to :party_list }
    it { should have_and_belong_to_many :senators }
  end
end
