FactoryGirl.define do
  factory :party_list do
    name { FFaker::Lorem.word }
    acronym { FFaker::Lorem.word }
    sequence(:ballot_number) {|n| n}
  end
end
