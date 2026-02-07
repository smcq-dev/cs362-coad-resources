FactoryBot.define do
  factory :ticket do
    sequence(:name) { |n| "Requester #{n}" }
    phone { "+1 541-555-1234" }
    description { "Test ticket description." }

    association :region
    association :resource_category

    closed { false }

    trait :closed do
      closed { true }
    end

    trait :captured do
      association :organization
    end
  end
end