
FactoryGirl.define do
  factory :valid_random_category, class: Category do
    name 'Ruby'
    sequence(:description) { |n| "category#{n}'s' description" }
  end

  factory :valid_category, class: Category do
    name 'Ruby'
    description 'A Script Language'
  end
end