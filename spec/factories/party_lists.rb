FactoryGirl.define do
  factory :party_list do
    name { FFaker::Lorem.word }
    acronym { FFaker::Lorem.word }
    ballot_number { Random.rand(1..100) }
  end
end
