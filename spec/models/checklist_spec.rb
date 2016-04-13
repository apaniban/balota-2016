require 'rails_helper'

RSpec.describe Checklist, type: :model do
  context 'relationships' do
    it { should belong_to :president }
    it { should belong_to :vice_president }
    it { should belong_to :party_list }
  end
end
