FactoryGirl.define do
  factory :checklist do
    association :user
    association :president
    association :vice_president
    association :party_list

    transient do
      senators_count 12
    end

    after(:create) do |checklist, evaluator|
      create_list(:senator, evaluator.senators_count, checklists: [checklist])
    end
  end
end
