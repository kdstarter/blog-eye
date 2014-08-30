
FactoryGirl.define do
  factory :valid_random_category, class: User do
    sequence(:name) { |n| "category#{n}" }
    sequence(:description) { |n| "category#{n}'s' description" }
  end
end