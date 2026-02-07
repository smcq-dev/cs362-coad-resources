FactoryBot.define do
  factory :organization do
    sequence(:email) { |n| "org#{n}@example.com" }
    sequence(:name) { |n| "Organization #{n}" }

    phone { "555-555-5555" }
    primary_name { "Primary Contact" }
    secondary_name { "Secondary Contact" }
    secondary_phone { "555-555-5556" }

    description { "Test organization description." }
  end
end
