FactoryGirl.define do
  factory :senator do
    name { FFaker::Name.name }
    ballot_name { FFaker::Name.name }
    sequence(:ballot_number) {|n| n}

    association :party
  end
end
