FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }

    confirmed_at { Time.current }

    trait :admin do
      role { :admin }
    end

    trait :organization_user do
      role { :organization }
      association :organization
    end
  end
end