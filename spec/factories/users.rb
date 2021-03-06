FactoryBot.define do
  factory :user do
  	sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "zzz@gamil.com" }
  	password { 'password' }
  	password_confirmation { 'password' }

    trait :partner do
      sequence(:name) { |n| "user#{n}" }
      sequence(:email) { |n| "partner@gamil.com" }
    end
  end
end