FactoryGirl.define do
  factory :president do
    name { FFaker::Name.name }
    ballot_name { FFaker::Name.name }
    ballot_number { Random.rand(1..100) }

    association :party
  end
end
