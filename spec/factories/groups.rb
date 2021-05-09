FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "サンプルグループ#{n}" }
  end
end
