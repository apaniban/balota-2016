FactoryGirl.define do
  factory :party do
    name { FFaker::Lorem.word }
    acronym { FFaker::Lorem.word }
  end
end
