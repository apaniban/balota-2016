FactoryGirl.define do
  factory :user do
    name { FFaker::Name.name }
    username { FFaker::Internet.user_name }
    password "password"
    password_confirmation "password"

    factory :user_with_checklist do
      after(:create) do |user, evaluator|
        create(:checklist, user: user)
      end
    end
  end
end
