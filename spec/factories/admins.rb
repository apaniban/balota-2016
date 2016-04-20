FactoryGirl.define do
  factory :admin do
    email { FFaker::Internet.email }
    name { FFaker::Name.name }
    password "password"
    password_confirmation "password"
  end
end
